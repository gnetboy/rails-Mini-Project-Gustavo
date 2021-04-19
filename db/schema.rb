
ActiveRecord::Schema.define(version: 2021_04_18_201548) do

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.string "capital"
    t.string "currency"
    t.string "timezone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_countries_on_user_id"
  end

  create_table "country_students", id: false, force: :cascade do |t|
    t.integer "country_id", null: false
    t.integer "student_id", null: false
    t.date "start_date"
    t.date "end_date"
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email"
    t.string "phone"
    t.integer "user_id"
    t.index ["user_id"], name: "index_students_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
