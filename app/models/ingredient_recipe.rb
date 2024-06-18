class IngredientRecipe < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient
  belongs_to :profil
  validates :quantity, presence: true
end
