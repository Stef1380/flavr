class Restriction < ApplicationRecord
  has_many :restriction_profils
  validates :restriction_label, presence: true
end
