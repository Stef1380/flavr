class CreateDiets < ActiveRecord::Migration[7.1]
  def change
    create_table :diets do |t|
      t.string :diet_label

      t.timestamps
    end
  end
end
