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

ActiveRecord::Schema.define(version: 2018_08_14_071457) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "deliveries", force: :cascade do |t|
    t.integer "worker_id"
    t.integer "package_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "packages", force: :cascade do |t|
    t.integer "customer_id"
    t.string "name_on_package"
    t.string "phone_on_package"
    t.string "kuai_di_code"
    t.string "size"
    t.string "delivery_location_name"
    t.float "delivery_location_lat"
    t.float "delivery_location_lng"
    t.string "delivery_time_start"
    t.string "delivery_time_end"
    t.boolean "available", default: true, null: false
    t.boolean "accepted", default: false, null: false
    t.boolean "completed", default: false, null: false
    t.integer "verification_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "comment"
  end

  create_table "users", force: :cascade do |t|
    t.string "open_id"
    t.string "student_number"
    t.string "name"
    t.string "phone_number"
    t.string "address_name"
    t.float "address_lat"
    t.float "address_lng"
    t.string "static_pay_qr"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
