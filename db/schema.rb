
ActiveRecord::Schema.define(version: 2021_04_03_081135) do

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "courses_students", id: false, force: :cascade do |t|
    t.integer "student_id", null: false
    t.integer "course_id", null: false
    t.index ["student_id", "course_id"], name: "index_courses_students_on_student_id_and_course_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
