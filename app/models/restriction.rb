class Restriction < ApplicationRecord
  has_many :restriction_profils
  validates :name, presence: true
end
