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

ActiveRecord::Schema[8.1].define(version: 2026_07_30_091655) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "cards", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "card_type", null: false
    t.datetime "created_at", null: false
    t.uuid "match_id", null: false
    t.integer "minute"
    t.uuid "player_id", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id"], name: "index_cards_on_match_id"
    t.index ["player_id"], name: "index_cards_on_player_id"
  end

  create_table "goals", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "assist_id"
    t.datetime "created_at", null: false
    t.uuid "match_id", null: false
    t.integer "minute"
    t.uuid "scorer_id", null: false
    t.uuid "team_id", null: false
    t.datetime "updated_at", null: false
    t.index ["assist_id"], name: "index_goals_on_assist_id"
    t.index ["match_id"], name: "index_goals_on_match_id"
    t.index ["scorer_id"], name: "index_goals_on_scorer_id"
    t.index ["team_id"], name: "index_goals_on_team_id"
  end

  create_table "managers", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.date "appointed_on"
    t.datetime "created_at", null: false
    t.text "name", null: false
    t.text "nationality"
    t.integer "status", default: 0
    t.uuid "team_id"
    t.datetime "updated_at", null: false
    t.index ["id"], name: "index_managers_on_id", unique: true
    t.index ["team_id"], name: "index_managers_on_team_id"
  end

  create_table "match_lineups", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.uuid "match_id", null: false
    t.uuid "player_id", null: false
    t.boolean "started"
    t.uuid "team_id", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id", "player_id"], name: "index_match_lineups_on_match_id_and_player_id", unique: true
    t.index ["match_id"], name: "index_match_lineups_on_match_id"
    t.index ["player_id"], name: "index_match_lineups_on_player_id"
    t.index ["team_id"], name: "index_match_lineups_on_team_id"
  end

  create_table "matches", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.date "date", null: false
    t.text "match_type", null: false
    t.text "referee", null: false
    t.uuid "team_a_id", null: false
    t.integer "team_a_score"
    t.uuid "team_b_id", null: false
    t.integer "team_b_score"
    t.uuid "tournament_id"
    t.datetime "updated_at", null: false
    t.text "venue", null: false
    t.index ["id"], name: "index_matches_on_id", unique: true
    t.index ["team_a_id"], name: "index_matches_on_team_a_id"
    t.index ["team_b_id"], name: "index_matches_on_team_b_id"
    t.index ["tournament_id"], name: "index_matches_on_tournament_id"
  end

  create_table "players", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.text "code", null: false
    t.text "country_of_origin", null: false
    t.datetime "created_at", null: false
    t.date "date_of_birth", null: false
    t.text "name", null: false
    t.integer "status"
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_players_on_code", unique: true
  end

  create_table "teams", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.text "country", null: false
    t.datetime "created_at", null: false
    t.text "name", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "index_teams_on_id", unique: true
    t.index ["name"], name: "index_teams_on_name", unique: true
  end

  create_table "tournaments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "host_country", null: false
    t.text "name", null: false
    t.datetime "updated_at", null: false
    t.text "year", null: false
    t.index ["id"], name: "index_tournaments_on_id", unique: true
  end

  add_foreign_key "cards", "matches"
  add_foreign_key "cards", "players"
  add_foreign_key "goals", "matches"
  add_foreign_key "goals", "players", column: "assist_id"
  add_foreign_key "goals", "players", column: "scorer_id"
  add_foreign_key "goals", "teams"
  add_foreign_key "managers", "teams"
  add_foreign_key "match_lineups", "matches"
  add_foreign_key "match_lineups", "players"
  add_foreign_key "match_lineups", "teams"
  add_foreign_key "matches", "teams", column: "team_a_id"
  add_foreign_key "matches", "teams", column: "team_b_id"
  add_foreign_key "matches", "tournaments"
end
