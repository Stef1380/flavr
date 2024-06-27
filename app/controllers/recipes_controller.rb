class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
<<<<<<< HEAD
    # @recipe = Recipe.find(params[:id])
=======
>>>>>>> 77ce04cd0b961fd9976fff990604fab9f86d7a72
    @recipe_ai = Recipe.recipe_ai(current_user)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end
end
