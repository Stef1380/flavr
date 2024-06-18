class Avatar < ApplicationRecord
  has_many :profils
  validates :url, presence: true
end
