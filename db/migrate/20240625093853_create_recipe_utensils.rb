class CreateRecipeUtensils < ActiveRecord::Migration[7.1]
  def change
    create_table :recipe_utensils do |t|
      t.references :recipe, foreign_key: true
      t.references :utensil, foreign_key: true
      t.timestamps
    end
  end
end
