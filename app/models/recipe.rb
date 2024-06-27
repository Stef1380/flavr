require 'open-uri'

class Recipe < ApplicationRecord
  has_many :ingredient_recipes
  has_many :recipe_utensils
  has_many :utensils, through: :recipe_utensils
  has_many :recipe_steps
  has_many :step_by_steps, through: :recipe_steps
  has_many :user_recipes
  has_many :users, through: :user_recipes
  has_one_attached :photo
  validates :name, presence: true
  validates :description, presence: true

  def self.recipe_ai(current_user)
    parsed_recipes = send(:recipe_ai_generate, current_user)
    parsed_recipes.each do |recipe_data|
      created_recipe = send(:recipes_create, recipe_data)
      send(:utensils_create, recipe_data, created_recipe)
      send(:ingredients_create, recipe_data, created_recipe)
      send(:steps_create, recipe_data, created_recipe)
      send(:user_recipe, current_user, created_recipe)
    end
  end

  private

  def self.recipe_ai_generate(current_user)
    current_user_profils = current_user.profils
    restrictions = Restriction.joins(profils: :user).where(users: { id: current_user.id }).pluck(:name)
    preferences_dislike = Ingredient.joins(profils: :user).where(users: { id: current_user.id },
                                                                 preferences: { like: false }).pluck(:name)
    preferences_like = Ingredient.joins(profils: :user).where(users: { id: current_user.id },
                                                              preferences: { like: true }).pluck(:name)
    diet = Diet.joins(profils: :user).where(users: { id: current_user.id }).pluck(:name)
    # target = Target.joins(profils: :user).where(users: { id: current_user.id }).pluck(:name)
    recipes = current_user.recipes.pluck(:name)

    client = OpenAI::Client.new
    chatgpt_response = client.chat(parameters: {
                                     model: "gpt-4o",
                                     messages: [{ role: "user", content:
         "Génère 1 recette de cuisine qui convient pour des personnes avec des régimes alimentaires différents: #{diet}
          Qui sont différentes de #{recipes}
          Qui ne peuvent absolument pas manger (allergies et intolérance): #{restrictions}
          les recettes ne doivent pas contenir les ingrédients: #{preferences_dislike}.
          les recettes doivents avoir un minimum de 3 ingrédients.
          Les recettes doivent chacune avoir des ingrédients différents.
          Génère au maximum 2 recettes avec les ingrédients préférés: #{preferences_like}.
          les recettes générées doivent avoir des niveaux de difficultés aléatoires.
          les recettes ont 4 étape de réalisation maximum.
          Formate la recette en json avec:
          hash de 'recipe': {name: 'le nom de la recette', description: 'appétissante de la recette en 150 caractères maximum', time: 'temps de réalisation de la recette', level: 'niveau de difficulté de la recette', kcal_tot: 'calorie totale en kcal de la recette pour tous les ingrédients', kitchen_type: 'spécialité de la recette, par exemple française, japonaise etc..'}
          hash des 'utensils': {name: 'nom', description: 'type de l'ustensile'}
          Hash des 'ingredients': {name: 'nom de l’ingrédient', quantity: 'quantité pour la recette', Kcal: 'calories correspondantes à la  quantité de la recette en Kcal', Kcal_100g: 'calories pour 100g de l’ingrédient'}
          Hash de 'step_by_step': {step: 'étape de la recette', description: 'instruction détaillée de l'étape de la recette en 250 caractères minimum et 600 caractères maximum'}
          Je veux un json (avec un délimitation json au début et à la fin par json) par recette sans texte d'introduction ou de conclusion." }]
                                   })
    # création du json
    @content = chatgpt_response["choices"][0]["message"]["content"]
    # json_string = @content.match(/```json\n(.*?)\n```/m)[1]
    # @recipe_object = JSON.parse(json_string)

    json_strings = @content.scan(/```json\n(.*?)\n```/m).flatten
    parsed_recipes = json_strings.map { |json_str| JSON.parse(json_str) }
    return parsed_recipes
  end

  def self.recipes_create(recipe_data)
    created_recipe = Recipe.create!(name: recipe_data["recipe"]["name"],
                                    description: recipe_data["recipe"]["description"],
                                    time: recipe_data["recipe"]["time"],
                                    level: recipe_data["recipe"]["level"],
                                    kcal: recipe_data["recipe"]["kcal_tot"],
                                    recipe_type: recipe_data["recipe"]["kitchen_type"])
    client = OpenAI::Client.new
    dalle_response = client.images.generate(
        parameters: {
          prompt: "une image réaliste de #{created_recipe.name} dont la description est: #{created_recipe.description}",
          size: "1024x1024"
        }
      )
      image_url = dalle_response["data"][0]["url"]
      created_recipe.photo.attach(io: URI.open(image_url), filename: created_recipe.name)
      # uploaded_image = Cloudinary::Uploader.upload(image_url, public_id: created_recipe.name)
      # created_recipe.photo.attach(image_url: uploaded_image["secure_url"])
      return created_recipe
  end

  def self.utensils_create(recipe_data, created_recipe)
    recipe_data["utensils"].each do |utensil_data|
      created_utensil = Utensil.create!(name: utensil_data["name"],
                                        description: utensil_data["description"])
      RecipeUtensil.create!(recipe_id: created_recipe.id, utensil_id: created_utensil.id)
    end
  end

  def self.ingredients_create(recipe_data, created_recipe)
    recipe_data["ingredients"].each do |ingredient_data|
      created_ingredient = Ingredient.create!(name: ingredient_data["name"],
                                              kcal_100g: ingredient_data["kcal_100g"])
      IngredientRecipe.create!(recipe_id: created_recipe.id,
                               ingredient_id: created_ingredient.id,
                               quantity: ingredient_data["quantity"],
                               Kcal: ingredient_data["kcal"])
    end
  end

  def self.steps_create(recipe_data, created_recipe)
    recipe_data["step_by_step"].each do |step|
      created_step = StepByStep.create!(step: step["step"],
                                        description: step["description"])
      RecipeStep.create!(recipe_id: created_recipe.id, step_by_step_id: created_step.id)

      # client = OpenAI::Client.new
      # dalle_response = client.images.generate(
      #     parameters: {
      #       prompt: "une image réaliste de l'etape de réalisation #{created_step.description} de la recette #{created_recipe.name}",
      #       size: "1024x1024"
      #     }
      #   )
      #   image_url = dalle_response["data"][0]["url"]
      #   created_step.photo.attach(io: URI.open(image_url), filename: created_recipe.name)
    end
  end

  def self.user_recipe(current_user, created_recipe)
    UserRecipe.create!(user_id: current_user.id, recipe_id: created_recipe.id)
  end
end
