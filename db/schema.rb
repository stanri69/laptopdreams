ActiveRecord::Schema[7.0].define(version: 2022_11_07_215048) do
  enable_extension "plpgsql"

  create_table "additionallies", force: :cascade do |t|
    t.string "additionally_features"
    t.string "producing_country"
    t.string "supply_set"
    t.string "registration"
    t.string "guarantee"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.integer "ssd_volume"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "laptops", force: :cascade do |t|
    t.string "full_name"
    t.integer "price"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "processors", force: :cascade do |t|
    t.string "name"
    t.boolean "operating_system"
    t.integer "clock_frequency"
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

  create_table "videocards", force: :cascade do |t|
    t.string "type_videocard"
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
