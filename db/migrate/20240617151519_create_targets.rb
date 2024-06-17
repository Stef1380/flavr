class CreateTargets < ActiveRecord::Migration[7.1]
  def change
    create_table :targets do |t|
      t.string :target_label

      t.timestamps
    end
  end
end
