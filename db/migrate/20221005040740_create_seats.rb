class CreateSeats < ActiveRecord::Migration[7.0]
  def change
    create_table :seats do |t|
      t.references :school, null: false, foreign_key: true
      t.references :home_address, null: false, foreign_key: true

      t.timestamps
    end
  end
end
