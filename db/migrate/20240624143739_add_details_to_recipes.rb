class AddDetailsToRecipes < ActiveRecord::Migration[7.1]
  def change
    add_column :recipes, :level, :string
    add_column :recipes, :recipe_type, :string
    add_column :recipes, :time, :string
    add_column :recipes, :kcal, :integer
  end
end
