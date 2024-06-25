class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all

    current_user_profils = current_user.profils
    restrictions = Restriction.joins(profils: :user).where(users: { id: current_user.id }).pluck(:name)
    preferences_dislike = Ingredient.joins(profils: :user).where(users: { id: current_user.id }, preferences: { like: false } ).pluck(:name)
    preferences_like = Ingredient.joins(profils: :user).where(users: { id: current_user.id }, preferences: { like: true } ).pluck(:name)
    diet = Diet.joins(profils: :user).where(users: { id: current_user.id }).pluck(:name)
    target = Target.joins(profils: :user).where(users: { id: current_user.id }).pluck(:name)

    client = OpenAI::Client.new
    chaptgpt_response = client.chat(parameters: {
      model: "gpt-4o",
      messages: [{ role: "user", content:
        "génère 6 recettes de cuisine qui conviennent pour des personnes avec des régimes alimentaires différents: #{diet}
        Qui ne peuvent absolument pas manger (allergies et intolérance): #{restrictions}
        Qui aiment bien manger entres autres: #{preferences_like}
        Qui n'aiment pas: #{preferences_dislike}
        Qui ont des niveaux de difficultés: 3 faciles, 2 moyennnes, 1 difficile.
        Formate la recette en json avec:
        hash de recette {name: 'le nom de la recette', description: 'appétissante de la recette en 150 caractères maximum', temps: 'temps de réalisation de la recette', niveau: 'niveau de difficulté de la recette', Kcal_tot: 'calorie totale en Kcal de la recette pour tous les ingrédients', type: 'spécialité de la recette, par exemple française, japonaise etc..' }
        hash des ustensiles: { utensil: 'nom', description: 'type de l'ustensile' }
        Hash des ingrédients { name: 'nom de l’ingrédient', quantity: 'quantité pour la recette', Kcal: 'calories correspondantes à la  quantité de la recette en Kcal', Kcal_100g: 'calories pour 100g de l’ingrédient' }
        un hash de step_by_step de la recette: {step: 'étape de la recette', description: 'instruction détaillée de l'étape de la recette en 250 caractères minimum et 600 caractères maximum'}
        Je veux seulement un json par recette sans texte d'introduction ou de conclusion."
          }]
      })
    chaptgpt_response["choices"][0]["message"]["content"]

   raise

  end

  def show
    @recipe = Recipe.find(params[:id])
  end
end
