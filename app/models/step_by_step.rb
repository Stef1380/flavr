class StepByStep < ApplicationRecord
  has_many :recipe_steps
  has_many :recipes, through: :recipe_steps
end
