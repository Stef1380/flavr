class CreatePreferences < ActiveRecord::Migration[7.1]
  def change
    create_table :preferences do |t|
      t.boolean :like
      t.references :ingredient, foreign_key: true
      t.timestamps
    end
  end
end
