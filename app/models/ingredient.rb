class Ingredient < ApplicationRecord
  has_many :recipe_ingredients
  has_many :preferences
  validates :name, presence: true
  validates :kcal, presence: true
end
