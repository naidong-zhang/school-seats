class CreateSchoolDivisions < ActiveRecord::Migration[7.0]
  def change
    create_table :school_divisions do |t|
      t.string :name

      t.timestamps
    end
  end
end
