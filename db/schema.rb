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

ActiveRecord::Schema[7.1].define(version: 2024_04_25_085556) do
  create_table "facilities", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_facilities_on_name", unique: true
  end

  create_table "hotel_facilities", force: :cascade do |t|
    t.integer "hotel_id", null: false
    t.integer "facility_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["facility_id"], name: "index_hotel_facilities_on_facility_id"
    t.index ["hotel_id", "facility_id"], name: "index_hotel_facilities_on_hotel_id_and_facility_id", unique: true
    t.index ["hotel_id"], name: "index_hotel_facilities_on_hotel_id"
  end

  create_table "hotel_images", force: :cascade do |t|
    t.string "url"
    t.string "caption"
    t.string "category"
    t.integer "hotel_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hotel_id"], name: "index_hotel_images_on_hotel_id"
  end

  create_table "hotels", force: :cascade do |t|
    t.string "ref_id", null: false
    t.integer "destination_id", null: false
    t.string "name"
    t.string "description"
    t.string "booking_conditions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ref_id", "destination_id"], name: "index_hotels_on_ref_id_and_destination_id", unique: true
  end

  create_table "locations", force: :cascade do |t|
    t.decimal "lat", precision: 10, scale: 6, default: "0.0"
    t.decimal "long", precision: 10, scale: 6, default: "0.0"
    t.string "postal_code"
    t.string "address"
    t.string "country"
    t.integer "hotel_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hotel_id"], name: "index_locations_on_hotel_id"
  end

  add_foreign_key "hotel_images", "hotels"
  add_foreign_key "locations", "hotels"
end
