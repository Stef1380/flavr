class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @utensils = @recipe.utensils
    @ingredients = @recipe.ingredient_recipes.map { |ingredient_recipe| ingredient_recipe.ingredient }
    @ingredient_recipes = @recipe.ingredient_recipes.includes(:ingredient)
    @steps_by_steps = Recipe.find(params[:id]).step_by_steps

  end

  def create
    @recipe = Recipe.recipe_ai(current_user)
    redirect_to root_path
  end
end
