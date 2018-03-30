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

ActiveRecord::Schema.define(version: 20180330081739) do

  create_table "centers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.bigint "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_centers_on_city_id"
  end

  create_table "cities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meditator_program_attendances", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "meditator_id"
    t.bigint "program_id"
    t.string "batch"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meditator_id"], name: "index_meditator_program_attendances_on_meditator_id"
    t.index ["program_id"], name: "index_meditator_program_attendances_on_program_id"
  end

  create_table "meditator_programs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "meditator_id"
    t.bigint "program_id"
    t.string "batch"
    t.datetime "date"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meditator_id"], name: "index_meditator_programs_on_meditator_id"
    t.index ["program_id"], name: "index_meditator_programs_on_program_id"
  end

  create_table "meditators", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "phone"
    t.string "email"
    t.string "pin_code"
    t.string "gender"
    t.string "status"
    t.string "occupation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "programs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.string "batches"
    t.string "status"
    t.string "teachers"
    t.bigint "center_id"
    t.bigint "user_id"
    t.string "central_id"
    t.string "type"
    t.index ["center_id"], name: "index_programs_on_center_id"
    t.index ["user_id"], name: "index_programs_on_user_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
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
  add_foreign_key "meditator_program_attendances", "meditators"
  add_foreign_key "meditator_program_attendances", "programs"
  add_foreign_key "meditator_programs", "meditators"
  add_foreign_key "meditator_programs", "programs"
  add_foreign_key "programs", "centers"
  add_foreign_key "programs", "users"
  add_foreign_key "users", "cities"
end
