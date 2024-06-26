class IngredientRecipe < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient
  has_one_attached :photo
  validates :quantity, presence: true
end
