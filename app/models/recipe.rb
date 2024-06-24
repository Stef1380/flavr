class Recipe < ApplicationRecord
  has_many :ingredient_recipes
  validates :name, presence: true
  validates :description, presence: true

  def self.recipe_ai(current_user)
    current_user_profils = current_user.profils
    restrictions = Restriction.joins(profils: :user).where(users: { id: current_user.id }).pluck(:name)
    preferences_dislike = Ingredient.joins(profils: :user).where(users: { id: current_user.id },
                                                                 preferences: { like: false }).pluck(:name)
    preferences_like = Ingredient.joins(profils: :user).where(users: { id: current_user.id },
                                                              preferences: { like: true }).pluck(:name)
    diet = Diet.joins(profils: :user).where(users: { id: current_user.id }).pluck(:name)
    target = Target.joins(profils: :user).where(users: { id: current_user.id }).pluck(:name)

    client = OpenAI::Client.new
    chatgpt_response = client.chat(parameters: {
                                     model: "gpt-4o",
                                     messages: [{ role: "user", content:
        "génère 3 recettes de cuisine qui conviennent pour des personnes avec des régimes alimentaires différents: #{diet}
          Qui ne peuvent absolument pas manger (allergies et intolérance): #{restrictions}
          Qui aiment bien manger entres autres: #{preferences_like}
          Qui n'aiment pas: #{preferences_dislike}
          Qui ont des niveaux de difficultés: 3 faciles, 2 moyennnes, 1 difficile.
          Formate la recette en json avec:
          hash de 'recipe': {name: 'le nom de la recette', description: 'appétissante de la recette en 150 caractères maximum', time: 'temps de réalisation de la recette', level: 'niveau de difficulté de la recette', Kcal_tot: 'calorie totale en Kcal de la recette pour tous les ingrédients', type: 'spécialité de la recette, par exemple française, japonaise etc..'}
          hash des 'utensils': {utensil: 'nom', description: 'type de l'ustensile'}
          Hash des 'ingredients': {name: 'nom de l’ingrédient', quantity: 'quantité pour la recette', Kcal: 'calories correspondantes à la  quantité de la recette en Kcal', Kcal_100g: 'calories pour 100g de l’ingrédient'}
          Hash de 'step_by_step': {step: 'étape de la recette', description: 'instruction détaillée de l'étape de la recette en 250 caractères minimum et 600 caractères maximum'}
          Je veux un json (avec un délimitation json au début et à la fin par json) par recette avec un id pour la recette sans texte d'introduction ou de conclusion." }]
                                   })
    # création du json
    @content = chatgpt_response["choices"][0]["message"]["content"]
    # json_string = @content.match(/```json\n(.*?)\n```/m)[1]
    # @recipe_object = JSON.parse(json_string)

    json_strings = @content.scan(/```json\n(.*?)\n```/m).flatten
    parsed_recipes = json_strings.map { |json_str| JSON.parse(json_str) }

    parsed_recipes.each do |recipe|
      Recipe.create!(name: recipe["recipe"]["name"],
                     description: recipe["recipe"]["description"],
                     time: recipe["recipe"]["time"],
                     level: recipe["recipe"]["level"],
                     kcal: recipe["recipe"]["kcal_tot"],
                     recipe_type: recipe["recipe"]["type"])
    end

    parsed_recipes.each do |ustensil|
      Recipe.create!(name: ustensil["ustensil"]["name"],
                     description: ustensil["ustensil"]["description"])
    end


    private

    def create_recipe
      parsed_recipes.each do |recipe|
        Recipe.create!(name: recipe["recipe"]["name"],
                       description: recipe["recipe"]["description"],
                       time: recipe["recipe"]["time"],
                       level: recipe["recipe"]["level"],
                       kcal: recipe["recipe"]["kcal_tot"],
                       recipe_type: recipe["recipe"]["type"])
    end

    def create_ingredients
    end

    def create_utensils
    end

    def create_steps
    end

    # @recipe_utensils = parsed_recipes[i]["utensils"] recipe.id = recipe
    # @recipe_ingredients = parsed_recipes[i]["ingredients"]
    # @recipe_steps_0 = parsed_recipes[i]["step_by_step"]

    # @recipe_recipe = @recipe_object[0]["recipe"]
    # @recipe_recipe = @recipe_object[1]["recipe"]
    # @recipe_utensils = @recipe_object["utensils"]
    # @recipe_ingredients = @recipe_object["ingredients"]
    # @recipe_steps = @recipe_object["rstep_by_step"]
    # @recipe_ustensils = parsed_data["utensils"]

    # @recipe.update(ustensil: parsed_data["utensils"])
    # Utensil.create(content: parsed_data["utensils"][0])
    # recipe_ustensils.create(user: current_user, ustensil: ustensil)
  end
end
