class RecipeStep < ApplicationRecord
  belongs_to :recipe
  belongs_to :step_by_step
end
