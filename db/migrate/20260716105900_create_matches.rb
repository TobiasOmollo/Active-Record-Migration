class CreateMatches < ActiveRecord::Migration[8.1]
  def change
    create_table :matches, id: false do |t|
      t.text :id, null: false
      t.text :team_a_id, null: false
      t.text :team_b_id, null: false
      t.date :date, null: false
      t.text :venue, null: false
      t.text :referee, null: false
      t.text :tournament_id       
      t.text :match_type, null: false

      t.timestamps
    end
    add_index :matches, :id, unique: true
    add_index :matches, :team_a_id
    add_index :matches, :team_b_id
    add_index :matches, :tournament_id

    add_foreign_key :matches, :teams, column: :team_a_id
    add_foreign_key :matches, :teams, column: :team_b_id
    add_foreign_key :matches, :tournaments, column: :tournament_id
  end
end