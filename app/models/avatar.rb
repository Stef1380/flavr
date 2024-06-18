class Avatar < ApplicationRecord
  has_many :profils
  validates :avatar_url, presence: true
end
