class Restriction < ApplicationRecord
  has_many :restriction_profils
  has_many :profils, through: :restriction_profils
  validates :name, presence: true
end
