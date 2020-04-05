# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_05_100718) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ac_server_events", force: :cascade do |t|
    t.binary "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "type"
  end

  create_table "cars", force: :cascade do |t|
    t.string "name"
    t.string "model"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["model"], name: "index_cars_on_model"
  end

  create_table "client_connections", force: :cascade do |t|
    t.bigint "car_id"
    t.integer "car_index"
    t.bigint "driver_id"
    t.datetime "closed_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "skin"
    t.index ["car_id"], name: "index_client_connections_on_car_id"
    t.index ["driver_id", "car_id"], name: "index_client_connections_on_driver_id_and_car_id"
  end

  create_table "drivers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "guid"
    t.index ["guid"], name: "index_drivers_on_guid"
  end

  create_table "laps", force: :cascade do |t|
    t.bigint "session_participation_id"
    t.integer "time"
    t.integer "cuts"
    t.integer "cars_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "driver_id"
    t.bigint "car_id"
    t.bigint "track_id"
    t.index ["car_id"], name: "index_laps_on_car_id"
    t.index ["driver_id"], name: "index_laps_on_driver_id"
    t.index ["track_id"], name: "index_laps_on_track_id"
  end

  create_table "leaderboard_items", force: :cascade do |t|
    t.bigint "lap_id"
    t.bigint "session_participation_id"
    t.integer "rtime"
    t.integer "rlaps"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "racing_sessions", force: :cascade do |t|
    t.integer "index"
    t.integer "current_index"
    t.integer "count"
    t.string "server_name"
    t.string "name"
    t.integer "typ"
    t.integer "time"
    t.integer "setting_laps"
    t.integer "wait_time"
    t.integer "ambient_temperature"
    t.integer "road_temperature"
    t.string "weather_graphics"
    t.string "elapsed_ms"
    t.string "json_file"
    t.datetime "end_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "track_id"
    t.integer "total_laps", default: 0
    t.index ["track_id"], name: "index_racing_sessions_on_track_id"
  end

  create_table "session_participations", force: :cascade do |t|
    t.bigint "client_connection_id"
    t.bigint "racing_session_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_connection_id"], name: "index_session_participations_on_client_connection_id"
    t.index ["racing_session_id", "client_connection_id"], name: "index_session_connection"
  end

  create_table "tracks", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "config"
    t.index ["name", "config"], name: "index_tracks_on_name_and_config"
    t.index ["name"], name: "index_tracks_on_name"
  end

end
