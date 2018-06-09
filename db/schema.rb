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

ActiveRecord::Schema.define(version: 20180607125317) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "centers", force: :cascade do |t|
    t.string "name"
    t.bigint "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_centers_on_city_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "participants", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "email"
    t.string "pincode"
    t.string "gender"
    t.string "occupation"
    t.bigint "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_participants_on_city_id"
  end

  create_table "program_participants", force: :cascade do |t|
    t.bigint "participant_id"
    t.bigint "program_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "dropped_out"
    t.index ["participant_id"], name: "index_program_participants_on_participant_id"
    t.index ["program_id"], name: "index_program_participants_on_program_id"
  end

  create_table "programs", force: :cascade do |t|
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.bigint "center_id"
    t.bigint "user_id"
    t.string "type"
    t.string "digest"
    t.integer "online_registration_count"
    t.index ["center_id"], name: "index_programs_on_center_id"
    t.index ["user_id"], name: "index_programs_on_user_id"
  end

  create_table "temp_participants", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "email"
    t.string "pincode"
    t.string "gender"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "program_id"
    t.index ["program_id"], name: "index_temp_participants_on_program_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "role"
    t.string "phone", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "city_id"
    t.index ["city_id"], name: "index_users_on_city_id"
    t.index ["phone"], name: "index_users_on_phone", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "centers", "cities"
  add_foreign_key "participants", "cities"
  add_foreign_key "program_participants", "participants"
  add_foreign_key "program_participants", "programs"
  add_foreign_key "programs", "centers"
  add_foreign_key "programs", "users"
  add_foreign_key "temp_participants", "programs"
  add_foreign_key "users", "cities"
end
