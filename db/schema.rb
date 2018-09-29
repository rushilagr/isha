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

ActiveRecord::Schema.define(version: 20180929134250) do

  create_table "call_task_callers", force: :cascade do |t|
    t.bigint "caller_id"
    t.bigint "call_task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["call_task_id"], name: "index_call_task_callers_on_call_task_id"
    t.index ["caller_id"], name: "index_call_task_callers_on_caller_id"
  end

  create_table "call_task_participants", force: :cascade do |t|
    t.string "status"
    t.string "caller_comment"
    t.bigint "participant_id"
    t.bigint "call_task_id"
    t.bigint "call_task_caller_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["call_task_caller_id"], name: "index_call_task_participants_on_call_task_caller_id"
    t.index ["call_task_id"], name: "index_call_task_participants_on_call_task_id"
    t.index ["participant_id"], name: "index_call_task_participants_on_participant_id"
  end

  create_table "call_tasks", force: :cascade do |t|
    t.string "name"
    t.bigint "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "max_calls_per_caller"
    t.boolean "participants_created", default: false
    t.boolean "callers_created", default: false
    t.index ["creator_id"], name: "index_call_tasks_on_creator_id"
  end

  create_table "centers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "coordinator"
    t.bigint "sector_id"
    t.index ["sector_id"], name: "index_centers_on_sector_id"
  end

  create_table "circles", force: :cascade do |t|
    t.string "name"
    t.string "coordinator"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "participants", force: :cascade do |t|
    t.string "pid"
    t.string "name"
    t.string "phone"
    t.string "email"
    t.string "gender"
    t.string "occupation"
    t.string "company"
    t.date "dob"
    t.string "i_e_program_type"
    t.string "i_e_center"
    t.string "i_e_teacher"
    t.date "i_e_date"
    t.date "shoonya_date"
    t.date "bsp_date"
    t.date "silence_date"
    t.date "hata_yoga_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "pin_code_id"
    t.index ["pin_code_id"], name: "index_participants_on_pin_code_id"
  end

  create_table "pin_codes", force: :cascade do |t|
    t.string "string"
    t.string "state"
    t.float "lat"
    t.float "lng"
    t.bigint "center_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["center_id"], name: "index_pin_codes_on_center_id"
  end

  create_table "sectors", force: :cascade do |t|
    t.string "name"
    t.string "coordinator"
    t.bigint "circle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["circle_id"], name: "index_sectors_on_circle_id"
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
    t.bigint "center_id"
    t.index ["center_id"], name: "index_users_on_center_id"
    t.index ["phone"], name: "index_users_on_phone", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, where: "([reset_password_token] IS NOT NULL)"
  end

  add_foreign_key "call_task_callers", "users", column: "caller_id"
  add_foreign_key "call_tasks", "users", column: "creator_id"
  add_foreign_key "centers", "sectors"
  add_foreign_key "participants", "pin_codes"
  add_foreign_key "pin_codes", "centers"
  add_foreign_key "sectors", "circles"
  add_foreign_key "users", "centers"
end
