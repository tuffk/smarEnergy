# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170613171740) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "captures", force: :cascade do |t|
    t.bigint "device_id"
    t.datetime "start"
    t.datetime "stop"
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["device_id"], name: "index_captures_on_device_id"
  end

  create_table "devices", force: :cascade do |t|
    t.bigint "house_id"
    t.string "area"
    t.string "brand"
    t.string "type"
    t.integer "resource_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["house_id"], name: "index_devices_on_house_id"
  end

  create_table "houses", force: :cascade do |t|
    t.bigint "user_id"
    t.string "address"
    t.string "name"
    t.string "area"
    t.integer "rooms"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_houses_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
