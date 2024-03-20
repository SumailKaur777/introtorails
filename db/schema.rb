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

ActiveRecord::Schema[7.1].define(version: 2024_03_19_175755) do
  create_table "activities", force: :cascade do |t|
    t.integer "park_id", null: false
    t.string "name"
    t.text "description"
    t.integer "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["park_id"], name: "index_activities_on_park_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.integer "park_id", null: false
    t.string "name"
    t.text "description"
    t.date "date"
    t.time "time"
    t.integer "capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["park_id"], name: "index_events_on_park_id"
  end

  create_table "facilities", force: :cascade do |t|
    t.integer "park_id", null: false
    t.string "name"
    t.text "description"
    t.integer "capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["park_id"], name: "index_facilities_on_park_id"
  end

  create_table "parks", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.string "size"
    t.text "amenities"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "location_description"
    t.string "park_name"
    t.string "park_category"
    t.string "district"
    t.string "classification_type"
    t.string "neighbourhood"
  end

  add_foreign_key "activities", "parks"
  add_foreign_key "events", "parks"
  add_foreign_key "facilities", "parks"
end
