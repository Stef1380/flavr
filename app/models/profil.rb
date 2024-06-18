class Profil < ApplicationRecord
  belongs_to :user
  belongs_to :diet
  belongs_to :target
  belongs_to :avatar
  has_many :preferences
  has_many :ingredients, through: :preference
  has_many :restrictions, through: :restriction_profil
end
