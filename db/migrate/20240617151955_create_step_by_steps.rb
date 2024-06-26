class CreateStepBySteps < ActiveRecord::Migration[7.1]
  def change
    create_table :step_by_steps do |t|
      t.integer :step
      t.text :description
      t.timestamps
    end
  end
end
