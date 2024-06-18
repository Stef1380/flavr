class Ingredient < ApplicationRecord
  has_many :recipe_ingredients
  has_many :preferences
  validates :ingredient_label, presence: true
  validates :kcal, presence: true
end
