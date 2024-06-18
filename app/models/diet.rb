class Diet < ApplicationRecord
  has_many :profils
  validates :diet_label, presence: true
end
