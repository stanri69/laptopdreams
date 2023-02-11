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

ActiveRecord::Schema[7.0].define(version: 2023_02_11_013629) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

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

  create_table "additionallies", force: :cascade do |t|
    t.string "additionally_features"
    t.string "producing_country"
    t.string "supply_set"
    t.string "registration"
    t.string "guarantee"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "batteries", force: :cascade do |t|
    t.string "battery_capacity"
    t.integer "battery_life"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "connections", force: :cascade do |t|
    t.boolean "network_adapters"
    t.string "ports"
    t.string "wireless_communication"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "corps", force: :cascade do |t|
    t.string "color"
    t.integer "weight"
    t.string "sound_system"
    t.string "manipulators"
    t.string "dimensions"
    t.string "body_material"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dataloggers", force: :cascade do |t|
    t.integer "volume"
    t.string "type_datalogger"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "laptops", force: :cascade do |t|
    t.string "full_name"
    t.integer "price"
    t.text "description"
    t.string "brand"
    t.string "op"
    t.string "type_laptop"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "additionally_id", null: false
    t.bigint "battery_id", null: false
    t.bigint "connection_id", null: false
    t.bigint "corp_id", null: false
    t.bigint "datalogger_id", null: false
    t.bigint "processor_id", null: false
    t.bigint "ram_id", null: false
    t.bigint "screen_id", null: false
    t.bigint "videocard_id", null: false
    t.integer "seller_id"
    t.index ["additionally_id"], name: "index_laptops_on_additionally_id"
    t.index ["battery_id"], name: "index_laptops_on_battery_id"
    t.index ["connection_id"], name: "index_laptops_on_connection_id"
    t.index ["corp_id"], name: "index_laptops_on_corp_id"
    t.index ["datalogger_id"], name: "index_laptops_on_datalogger_id"
    t.index ["processor_id"], name: "index_laptops_on_processor_id"
    t.index ["ram_id"], name: "index_laptops_on_ram_id"
    t.index ["screen_id"], name: "index_laptops_on_screen_id"
    t.index ["videocard_id"], name: "index_laptops_on_videocard_id"
  end

  create_table "processors", force: :cascade do |t|
    t.string "name"
    t.boolean "operating_system"
    t.integer "clock_frequency"
    t.integer "number_cores"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rams", force: :cascade do |t|
    t.integer "amount"
    t.integer "number_slot"
    t.string "type_ram"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "screens", force: :cascade do |t|
    t.string "diagonal"
    t.string "screen_type"
    t.integer "resolution"
    t.integer "refresh_rate"
    t.boolean "built_camera"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sellers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_sellers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_sellers_on_reset_password_token", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "videocards", force: :cascade do |t|
    t.string "type_videocard"
    t.string "name"
    t.text "description"
    t.integer "amount_memory"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "laptops", "additionallies"
  add_foreign_key "laptops", "batteries"
  add_foreign_key "laptops", "connections"
  add_foreign_key "laptops", "corps"
  add_foreign_key "laptops", "dataloggers"
  add_foreign_key "laptops", "processors"
  add_foreign_key "laptops", "rams"
  add_foreign_key "laptops", "screens"
  add_foreign_key "laptops", "videocards"
end
