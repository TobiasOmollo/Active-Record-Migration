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

ActiveRecord::Schema[8.1].define(version: 2026_07_14_132819) do
  create_table "players", force: :cascade do |t|
    t.text "code", null: false
    t.text "country_of_origin", null: false
    t.datetime "created_at", null: false
    t.date "date_of_birth", null: false
    t.text "name", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_players_on_code", unique: true
  end

  create_table "teams", id: false, force: :cascade do |t|
    t.text "country", null: false
    t.datetime "created_at", null: false
    t.text "id", null: false
    t.text "name", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "index_teams_on_id", unique: true
  end
end
