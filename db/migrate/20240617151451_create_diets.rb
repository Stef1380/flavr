class CreateDiets < ActiveRecord::Migration[7.1]
  def change
    create_table :diets do |t|
      t.string :name
      t.timestamps
    end
  end
end
