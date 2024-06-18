class Preference < ApplicationRecord
  belongs_to :profil
  has_many :ingredients
end
