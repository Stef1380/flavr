class Recipe < ApplicationRecord
  has_many :ingredient_recipes
  validates :name, presence: true
  validates :description, presence: true
end
