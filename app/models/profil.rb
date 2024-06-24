class Profil < ApplicationRecord
  belongs_to :user
  belongs_to :diet
  belongs_to :target
  has_many :preferences, dependent: :destroy
  belongs_to :avatar
  has_many :ingredients, through: :preference
  has_many :restriction_profils, dependent: :destroy
  has_many :restrictions, through: :restriction_profils
  validates :age, presence: true
  validates :username, presence: true
  has_one_attached :photo
end
