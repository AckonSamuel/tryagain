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

ActiveRecord::Schema[7.0].define(version: 2023_01_23_095856) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "achievements", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "achievement_name", default: "", null: false
    t.string "year", default: "", null: false
    t.string "description", default: "", null: false
    t.uuid "club_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_id"], name: "index_achievements_on_club_id"
  end

  create_table "active_storage_attachments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.uuid "record_id", null: false
    t.uuid "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "club_executives", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "portfolio", default: "", null: false
    t.string "executive_name", default: "", null: false
    t.integer "contact", default: 0, null: false
    t.string "programme", default: "", null: false
    t.string "email", default: "", null: false
    t.uuid "club_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_id"], name: "index_club_executives_on_club_id"
  end

  create_table "club_patrons", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "office_in_knust", default: "", null: false
    t.string "patron_name", default: "", null: false
    t.integer "contact", default: 0, null: false
    t.string "constitution", default: "", null: false
    t.uuid "club_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_id"], name: "index_club_patrons_on_club_id"
  end

  create_table "club_staffs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "club_id", null: false
    t.uuid "staff_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_id"], name: "index_club_staffs_on_club_id"
    t.index ["staff_id"], name: "index_club_staffs_on_staff_id"
  end

  create_table "club_students", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "club_id", null: false
    t.uuid "student_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_id"], name: "index_club_students_on_club_id"
    t.index ["student_id"], name: "index_club_students_on_student_id"
  end

  create_table "clubs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "club_name", default: "", null: false
    t.integer "telephone_number", default: 0, null: false
    t.string "group", default: "", null: false
    t.string "description", default: "", null: false
    t.string "history", default: "", null: false
    t.string "meeting_time", default: "", null: false
    t.string "meeting_location", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "jti", default: "", null: false
    t.index ["email"], name: "index_clubs_on_email", unique: true
    t.index ["jti"], name: "index_clubs_on_jti"
    t.index ["reset_password_token"], name: "index_clubs_on_reset_password_token", unique: true
  end

  create_table "events", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "event_name", default: "", null: false
    t.string "description", default: "", null: false
    t.string "date", default: "", null: false
    t.string "location", default: "", null: false
    t.string "time", default: "", null: false
    t.uuid "club_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_id"], name: "index_events_on_club_id"
  end

  create_table "executives", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "portfolio"
    t.uuid "club_student_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_student_id"], name: "index_executives_on_club_student_id"
  end

  create_table "objectives", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "club_id", null: false
    t.string "statement", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_id"], name: "index_objectives_on_club_id"
  end

  create_table "patrons", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "club_staff_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_staff_id"], name: "index_patrons_on_club_staff_id"
  end

  create_table "posts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "caption"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "project_name", default: "", null: false
    t.string "description", default: "", null: false
    t.string "status", default: "", null: false
    t.uuid "club_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_id"], name: "index_projects_on_club_id"
  end

  create_table "staffs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name", default: "", null: false
    t.string "other_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.integer "phone_number", null: false
    t.string "role", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "jti", default: "", null: false
    t.index ["email"], name: "index_staffs_on_email", unique: true
    t.index ["jti"], name: "index_staffs_on_jti"
    t.index ["reset_password_token"], name: "index_staffs_on_reset_password_token", unique: true
  end

  create_table "students", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name", default: "", null: false
    t.string "other_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.integer "phone_number", null: false
    t.string "programme_name", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "jti", default: "", null: false
    t.index ["email"], name: "index_students_on_email", unique: true
    t.index ["jti"], name: "index_students_on_jti"
    t.index ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true
  end

  create_table "visions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "club_id", null: false
    t.string "statement", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_id"], name: "index_visions_on_club_id"
  end

  add_foreign_key "achievements", "clubs"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "club_executives", "clubs"
  add_foreign_key "club_patrons", "clubs"
  add_foreign_key "club_staffs", "clubs"
  add_foreign_key "club_staffs", "staffs"
  add_foreign_key "club_students", "clubs"
  add_foreign_key "club_students", "students"
  add_foreign_key "events", "clubs"
  add_foreign_key "executives", "club_students"
  add_foreign_key "objectives", "clubs"
  add_foreign_key "patrons", "club_staffs"
  add_foreign_key "projects", "clubs"
  add_foreign_key "visions", "clubs"
end
