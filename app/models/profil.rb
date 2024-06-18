class Profil < ApplicationRecord
  belongs_to :user
  belongs_to :diet
  belongs_to :target
  belongs_to :avatar
  has_many :ingredient_recipes
  validates :age, presence: true
  validates :username, presence: true
end
