class Recipe < ApplicationRecord
  has_many :ingredient_recipes
  validates :recipe_label, presence: true
  validates :recipe_description, presence: true
end
