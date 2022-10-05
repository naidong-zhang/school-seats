class CreateSchoolDivisionWards < ActiveRecord::Migration[7.0]
  def change
    create_table :school_division_wards do |t|
      t.string :name
      t.references :school_division, null: false, foreign_key: true
      t.references :ward, null: false, foreign_key: true

      t.timestamps
    end
  end
end
