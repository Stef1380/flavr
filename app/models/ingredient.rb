class Ingredient < ApplicationRecord
  has_many :recipe_ingredients
  has_many :preferences
end
