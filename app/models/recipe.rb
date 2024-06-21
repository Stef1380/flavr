class Recipe < ApplicationRecord
  has_many :ingredient_recipes
  validates :name, presence: true
  validates :description, presence: true

  def ask_recipe(restriction, diet, preference)
    client = OpenAI::Client.new
    chaptgpt_response = client.chat(parameters: {
      model: "gpt-4o",
      messages: [{ role: "user", content: "Donne moi une recette très simple de recette de cuisine pour une personne qui mange #{diet}.
         Qui ne peut pas manger #{restriction} et qui n'aime pas #{preference}
         Donne moi 3 étapes pour la recette" }]
      })
    return chaptgpt_response["choices"][0]["message"]["content"]
  end
end
