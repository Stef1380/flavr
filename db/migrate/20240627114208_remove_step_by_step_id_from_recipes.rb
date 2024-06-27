class RemoveStepByStepIdFromRecipes < ActiveRecord::Migration[6.0]
  def change
    remove_column :recipes, :step_by_step_id, :bigint
  end
end
