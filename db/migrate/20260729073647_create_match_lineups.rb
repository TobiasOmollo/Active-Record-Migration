class CreateMatchLineups < ActiveRecord::Migration[8.1]
  def change
    create_table :match_lineups, id: :uuid do |t|
      t.references :match, null: false, foreign_key: true, type: :uuid
      t.references :player, null: false, foreign_key: true, type: :uuid
      t.references :team, null: false, foreign_key: true, type: :uuid
      t.boolean :started

      t.timestamps
    end
    add_index :match_lineups, [:match_id, :player_id], unique: true
  end
end
