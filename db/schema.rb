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

ActiveRecord::Schema[7.1].define(version: 2023_12_17_145459) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
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

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "bookings", force: :cascade do |t|
    t.string "guest_id", null: false
    t.bigint "event_id", null: false
    t.integer "qty", null: false
    t.string "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_bookings_on_event_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "organizer_id", null: false
    t.string "title", null: false
    t.datetime "datetime", null: false
    t.string "venue", null: false
    t.string "details", null: false
    t.decimal "vip_price", null: false
    t.decimal "regular_price", null: false
    t.integer "available_slot", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events_speakers", id: false, force: :cascade do |t|
    t.bigint "speaker_id", null: false
    t.bigint "event_id", null: false
    t.index ["event_id", "speaker_id"], name: "index_events_speakers_on_event_id_and_speaker_id"
    t.index ["speaker_id", "event_id"], name: "index_events_speakers_on_speaker_id_and_event_id"
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "booking_id", null: false
    t.string "transaction_id", null: false
    t.integer "method", default: 0, null: false
    t.string "amount", null: false
    t.string "currency", null: false
    t.integer "status", null: false
    t.string "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_payments_on_booking_id"
  end

  create_table "speaker_events", force: :cascade do |t|
    t.bigint "speaker_id", null: false
    t.bigint "event_id", null: false
    t.string "topic", null: false
    t.string "details", null: false
    t.datetime "speak_from", null: false
    t.datetime "speak_to", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_speaker_events_on_event_id"
    t.index ["speaker_id"], name: "index_speaker_events_on_speaker_id"
  end

  create_table "speakers", force: :cascade do |t|
    t.string "owner_id", null: false
    t.string "title", null: false
    t.string "name", null: false
    t.text "bio", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :string, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "fname", default: "", null: false
    t.string "phone", default: "", null: false
    t.string "address", default: ""
    t.boolean "remember_card", default: false
    t.string "creadit_card", default: ""
    t.string "creadit_card_expiry", default: ""
    t.string "role", default: "guest", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bookings", "events"
  add_foreign_key "bookings", "users", column: "guest_id", on_delete: :cascade
  add_foreign_key "events", "users", column: "organizer_id", on_delete: :cascade
  add_foreign_key "payments", "bookings"
  add_foreign_key "speaker_events", "events"
  add_foreign_key "speaker_events", "speakers"
  add_foreign_key "speakers", "users", column: "owner_id", on_delete: :cascade
end
