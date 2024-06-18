class CreateRestrictionProfils < ActiveRecord::Migration[7.1]
  def change
    create_table :restriction_profils do |t|
      t.references :restriction, foreign_key: true
      t.timestamps
    end
  end
end
