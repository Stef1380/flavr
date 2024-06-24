class Profil < ApplicationRecord
  belongs_to :user
  belongs_to :diet
  belongs_to :target
  has_many :preferences
  has_many :ingredients, through: :preference
  has_many :restriction_profils
  has_many :restrictions, through: :restriction_profils
  validates :age, presence: true
  validates :username, presence: true
  has_one_attached :photo
end
