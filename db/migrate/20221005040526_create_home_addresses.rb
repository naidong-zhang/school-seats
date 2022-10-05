class CreateHomeAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :home_addresses do |t|
      t.string :street_name
      t.integer :street_number
      t.references :school_division_ward, null: false, foreign_key: true

      t.timestamps
    end
  end
end
