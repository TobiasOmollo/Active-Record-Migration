class CreateCards < ActiveRecord::Migration[8.1]
  def change
    create_table :cards, id: :uuid do |t|
      t.references :match, null: false, foreign_key: true, type: :uuid
      t.references :player, null: false, foreign_key: true, type: :uuid
      t.integer :card_type, null: false
      t.integer :minute

      t.timestamps
    end
  end
end
