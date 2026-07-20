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

ActiveRecord::Schema[8.1].define(version: 2026_07_20_054910) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "managers", id: :text, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "name", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "index_managers_on_id", unique: true
  end

  create_table "matches", id: :text, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.date "date", null: false
    t.text "match_type", null: false
    t.text "referee", null: false
    t.text "team_a_id", null: false
    t.text "team_b_id", null: false
    t.text "tournament_id"
    t.datetime "updated_at", null: false
    t.text "venue", null: false
    t.index ["id"], name: "index_matches_on_id", unique: true
    t.index ["team_a_id"], name: "index_matches_on_team_a_id"
    t.index ["team_b_id"], name: "index_matches_on_team_b_id"
    t.index ["tournament_id"], name: "index_matches_on_tournament_id"
  end

  create_table "players", primary_key: "code", id: :string, force: :cascade do |t|
    t.text "avatar"
    t.string "country_of_origin"
    t.datetime "created_at", null: false
    t.date "date_of_birth"
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "teams", id: :text, force: :cascade do |t|
    t.text "country", null: false
    t.datetime "created_at", null: false
    t.text "name", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "index_teams_on_id", unique: true
  end

  create_table "tournaments", id: :text, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "host_country", null: false
    t.text "name", null: false
    t.datetime "updated_at", null: false
    t.text "year", null: false
    t.index ["id"], name: "index_tournaments_on_id", unique: true
  end

  add_foreign_key "matches", "teams", column: "team_a_id"
  add_foreign_key "matches", "teams", column: "team_b_id"
  add_foreign_key "matches", "tournaments"
end
