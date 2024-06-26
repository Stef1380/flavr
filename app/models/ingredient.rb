class Ingredient < ApplicationRecord
  has_many :recipe_ingredients
  has_many :preferences
  has_many :profils, through: :preferences
  validates :name, presence: true
  has_one_attached :photo
  # validates :kcal_100g, presence: true

  def liked_by?(profil)
    preferences.where(profil:, like: true).any?
  end

  def disliked_by?(profil)
    preferences.where(profil:, like: false).any?
  end

  def self.img_ai
    client = OpenAI::Client.new
    chatgpt_response = client.chat(
      parameters: {
        model: "gpt-4o",
        messages: [{ role: "user", content:
              "donne moi dans un hash de 5 ingredients:
              name: 'un ingrédient pour cuisiner',
              kcal_100g: 'les calories par 100g'
              url: 'une image de l'ingrédient
              je veux juste le json sans introduction ou conclusion" }]
      }
    )

    @content = chatgpt_response["choices"][0]["message"]["content"]
    raise
    json_strings = @content.scan(/```json\n(.*?)\n```/m).flatten
    ingredient_data = json_strings.map { |json_str| JSON.parse(json_str) }

    ingredient_data.each do |ingredient|
      ingredient_name = ingredient["ingredient"]
      dalle_response = client.image.create(
        parameters: {
          prompt: "A realistic image of #{ingredient_name}",
          size: "1024x1024"
        }
      )
      ingredient["image"] = dalle_response["data"][0]["url"]
      uploaded_image = Cloudinary::Uploader.upload(image_url, public_id: ingredient_name)

      ingredient["image"] = uploaded_image["secure_url"]
    end
  end
end
