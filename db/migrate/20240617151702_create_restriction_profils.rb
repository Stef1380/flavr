class CreateRestrictionProfils < ActiveRecord::Migration[7.1]
  def change
    create_table :restriction_profils do |t|

      t.timestamps
    end
  end
end
