class Restriction < ApplicationRecord
  validates :restriction_label, presence: true
end
