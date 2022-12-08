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

ActiveRecord::Schema[7.0].define(version: 2022_12_08_051000) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "club_staffs", force: :cascade do |t|
    t.bigint "club_id", null: false
    t.bigint "staff_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_id"], name: "index_club_staffs_on_club_id"
    t.index ["staff_id"], name: "index_club_staffs_on_staff_id"
  end

  create_table "club_students", force: :cascade do |t|
    t.bigint "club_id", null: false
    t.bigint "student_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_id"], name: "index_club_students_on_club_id"
    t.index ["student_id"], name: "index_club_students_on_student_id"
  end

  create_table "clubs", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "telephone_number"
    t.string "group"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "executives", force: :cascade do |t|
    t.string "portfolio"
    t.bigint "club_student_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_student_id"], name: "index_executives_on_club_student_id"
  end

  create_table "patrons", force: :cascade do |t|
    t.bigint "club_staff_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_staff_id"], name: "index_patrons_on_club_staff_id"
  end

  create_table "staffs", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "phone_number"
    t.string "programme_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "club_staffs", "clubs"
  add_foreign_key "club_staffs", "staffs"
  add_foreign_key "club_students", "clubs"
  add_foreign_key "club_students", "students"
  add_foreign_key "executives", "club_students"
  add_foreign_key "patrons", "club_staffs"
end
