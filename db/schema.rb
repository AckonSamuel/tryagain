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

  create_table "academic_years", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "start_year"
    t.string "end_year"
    t.boolean "is_active"
    t.uuid "admin_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_academic_years_on_admin_id"
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

  create_table "admins", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.boolean "admin", default: false, null: false
    t.string "admin_name", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
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

  create_table "clubs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "club_name", default: "", null: false
    t.integer "telephone_number", default: 0, null: false
    t.string "group", default: "", null: false
    t.string "description", default: "", null: false
    t.string "history", default: "", null: false
    t.string "meeting_time", default: "", null: false
    t.string "meeting_location", default: "", null: false
    t.string "possible_membership_size", default: "0", null: false
    t.boolean "status", default: true, null: false
    t.string "application_type", default: "new registration", null: false
    t.uuid "academic_year_id", null: false
    t.integer "amount_due", default: 0, null: false
    t.integer "has_submitted", default: 0, null: false
    t.string "is_approved", default: "Not Approved", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "jti", default: "", null: false
    t.index ["academic_year_id"], name: "index_clubs_on_academic_year_id"
    t.index ["confirmation_token"], name: "index_clubs_on_confirmation_token", unique: true
    t.index ["email"], name: "index_clubs_on_email", unique: true
    t.index ["jti"], name: "index_clubs_on_jti"
    t.index ["reset_password_token"], name: "index_clubs_on_reset_password_token", unique: true
  end

  create_table "fees", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "amount", default: 0, null: false
    t.uuid "academic_year_id", null: false
    t.string "application_type", default: "new registration", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["academic_year_id"], name: "index_fees_on_academic_year_id"
  end

  create_table "payments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "club_id", null: false
    t.integer "amount_paid", default: 0, null: false
    t.string "transaction_id", default: "", null: false
    t.string "status", default: "pending", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["amount_paid"], name: "index_payments_on_amount_paid"
    t.index ["club_id"], name: "index_payments_on_club_id"
    t.index ["status"], name: "index_payments_on_status"
    t.index ["transaction_id"], name: "index_payments_on_transaction_id"
  end

  add_foreign_key "academic_years", "admins"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "club_executives", "clubs"
  add_foreign_key "club_patrons", "clubs"
  add_foreign_key "clubs", "academic_years"
  add_foreign_key "fees", "academic_years"
  add_foreign_key "payments", "clubs"
end
