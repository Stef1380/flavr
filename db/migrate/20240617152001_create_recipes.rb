class CreateRecipes < ActiveRecord::Migration[7.1]
  def change
    create_table :recipes do |t|
      t.string :recipe_label
      t.text :recipe_description
      t.timestamps
    end
  end
end
