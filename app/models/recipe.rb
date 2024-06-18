class Recipe < ApplicationRecord
  has_many :recipe_ingredients
  validates :recipe_label, presence: true
  validates :recipe_description, presence: true
end
