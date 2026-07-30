class CreateGoals < ActiveRecord::Migration[8.1]
  def change
    create_table :goals, id: :uuid do |t|
      t.references :match, null: false, foreign_key: true, type: :uuid
      t.references :scorer, null: false, foreign_key: { to_table: :players }, type: :uuid
      t.references :assist, foreign_key: { to_table: :players }, type: :uuid
      t.references :team, null: false, foreign_key: true, type: :uuid
      t.integer :minute

      t.timestamps
    end
  end
end
