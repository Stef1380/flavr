class Ingredient < ApplicationRecord
  has_many :recipe_ingredients
  has_many :preferences
  has_many :profils, through: :preferences
  validates :name, presence: true
  # validates :kcal_100g, presence: true

  def liked_by?(profil)
    preferences.where(profil: profil, like: true).any?
  end

  def disliked_by?(profil)
    preferences.where(profil: profil, like: false).any?
  end

end
