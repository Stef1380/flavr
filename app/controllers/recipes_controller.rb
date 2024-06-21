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
      messages: [{ role: "user", content: "recette de cuisine pour une personne qui mange #{diet}.
         Qui ne peut absolument pas manger: #{restrictions}
         qui aime manger: #{preferences_like}
         qui n'aime pas: #{preferences_dislike}
         Liste moi les ustensiles.
         Liste moi les ingrédients avec les calories.
         Donne moi la recette en 6 étapes maximum.
         " }]
      })
    chaptgpt_response["choices"][0]["message"]["content"]

   raise

  end

  def show
    @recipe = Recipe.find(params[:id])
  end
end
