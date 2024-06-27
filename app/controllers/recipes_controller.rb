class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    @recipe = Recipe.find(params[:id])
    @recipe_ai = Recipe.recipe_ai(current_user)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end
end
