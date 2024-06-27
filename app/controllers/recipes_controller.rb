class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    @recipe_ai = Recipe.recipe_ai(current_user)
  end

  def show
    @recipe = Recipe.find(params[:id])
    @utensils = @recipe.utensils
    @ingredients = @recipe.ingredient_recipes.map { |ingredient_recipe| ingredient_recipe.ingredient }
    @ingredient_recipes = @recipe.ingredient_recipes.includes(:ingredient)
    @steps_by_steps = Recipe.find(params[:id]).step_by_steps

  end
end
