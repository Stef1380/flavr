class CreateRestrictions < ActiveRecord::Migration[7.1]
  def change
    create_table :restrictions do |t|
      t.string :restriction_label
      t.timestamps
    end
  end
end
