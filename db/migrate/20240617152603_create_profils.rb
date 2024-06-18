class CreateProfils < ActiveRecord::Migration[7.1]
  def change
    create_table :profils do |t|
      t.string :username
      t.string :sexe
      t.integer :age
      t.references :user, foreign_key: true
      t.references :diet, foreign_key: true
      t.references :target, foreign_key: true
      t.references :avatar, foreign_key: true
      t.references :restriction_profil, foreign_key: true
      t.references :preference, foreign_key: true
      t.timestamps
    end
  end
end
