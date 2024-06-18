class CreateIngredientRecipes < ActiveRecord::Migration[7.1]
  def change
    create_table :ingredient_recipes do |t|
      t.float :quantity
      t.references :recipe, foreign_key: true
      t.references :ingredient, foreign_key: true
      t.references :profil, foreign_key: true
      t.timestamps
    end
  end
end
