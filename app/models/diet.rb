class Diet < ApplicationRecord
  has_many :profils
  validates :name, presence: true
end
