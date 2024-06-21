class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all

    current_user_profils = current_user.profils
    restrictions = Restriction.joins(profils: :user).where(users: { id: current_user.id }).pluck(:name)
    preferences_dislike = Ingredient.joins(profils: :user).where(users: { id: current_user.id }).pluck(:name)
    diet = Diet.joins(profils: :user).where(users: { id: current_user.id }).pluck(:name)
    target = Target.joins(profils: :user).where(users: { id: current_user.id }).pluck(:name)
    client = OpenAI::Client.new
    chaptgpt_response = client.chat(parameters: {
      model: "gpt-4o",
      messages: [{ role: "user", content: "Donne moi une recette très simple de recette de cuisine pour une personne qui mange #{diet}.
         Qui ne peut pas manger #{restrictions} et qui n'aime pas #{preferences_dislike}
         Donne moi 3 étapes pour la recette" }]
      })
    chaptgpt_response["choices"][0]["message"]["content"]

   raise

  end

  def show
    @recipe = Recipe.find(params[:id])
  end
end
