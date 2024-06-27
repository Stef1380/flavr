class PagesController < ApplicationController
  def home
    @recipes = Recipe.all.order(created_at: :desc)
  end
end
