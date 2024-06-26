class CreateRecipeSteps < ActiveRecord::Migration[7.1]
  def change
    create_table :recipe_steps do |t|
    t.references :recipe, foreign_key: true
    t.references :step_by_step, foreign_key: true
    t.timestamps
    end
  end
end
