class CreateProfils < ActiveRecord::Migration[7.1]
  def change
    create_table :profils do |t|
      t.string :username
      t.string :sexe
      t.integer :age

      t.timestamps
    end
  end
end
