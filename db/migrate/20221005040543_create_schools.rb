class CreateSchools < ActiveRecord::Migration[7.0]
  def change
    create_table :schools do |t|
      t.string :name
      t.integer :nursery
      t.integer :kindergarten
      t.integer :grade1
      t.integer :grade2
      t.integer :grade3
      t.integer :grade4
      t.integer :grade5
      t.integer :grade6
      t.integer :grade7
      t.integer :grade8
      t.integer :grade9
      t.integer :grade10
      t.integer :grade11
      t.integer :grade12
      t.references :school_division_ward, null: false, foreign_key: true

      t.timestamps
    end
  end
end
