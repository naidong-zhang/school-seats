# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_10_05_040740) do
  create_table "home_addresses", force: :cascade do |t|
    t.string "street_name"
    t.integer "street_number"
    t.integer "school_division_ward_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_division_ward_id"], name: "index_home_addresses_on_school_division_ward_id"
  end

  create_table "school_division_wards", force: :cascade do |t|
    t.string "name"
    t.integer "school_division_id", null: false
    t.integer "ward_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_division_id"], name: "index_school_division_wards_on_school_division_id"
    t.index ["ward_id"], name: "index_school_division_wards_on_ward_id"
  end

  create_table "school_divisions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.integer "nursery"
    t.integer "kindergarten"
    t.integer "grade1"
    t.integer "grade2"
    t.integer "grade3"
    t.integer "grade4"
    t.integer "grade5"
    t.integer "grade6"
    t.integer "grade7"
    t.integer "grade8"
    t.integer "grade9"
    t.integer "grade10"
    t.integer "grade11"
    t.integer "grade12"
    t.integer "school_division_ward_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_division_ward_id"], name: "index_schools_on_school_division_ward_id"
  end

  create_table "seats", force: :cascade do |t|
    t.integer "school_id", null: false
    t.integer "home_address_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["home_address_id"], name: "index_seats_on_home_address_id"
    t.index ["school_id"], name: "index_seats_on_school_id"
  end

  create_table "wards", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "home_addresses", "school_division_wards"
  add_foreign_key "school_division_wards", "school_divisions"
  add_foreign_key "school_division_wards", "wards"
  add_foreign_key "schools", "school_division_wards"
  add_foreign_key "seats", "home_addresses"
  add_foreign_key "seats", "schools"
end
