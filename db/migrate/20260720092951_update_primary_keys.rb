class UpdatePrimaryKeys < ActiveRecord::Migration[8.1]
  def change
    add_column :players, :id, :uuid

    remove_foreign_key :matches, :tournaments
    remove_foreign_key :matches, column: :team_a_id
    remove_foreign_key :matches, column: :team_b_id


    change_column :matches, :tournament_id, "uuid USING id::uuid"
    change_column :matches, :team_a_id, "uuid USING id::uuid"
    change_column :matches, :team_b_id, "uuid USING id::uuid"

    change_column :managers, :id, "uuid USING id::uuid"
    change_column :players, :id, "uuid USING id::uuid"
    change_column :matches, :id, "uuid USING id::uuid"
    change_column :tournaments, :id, "uuid USING id::uuid"
    change_column :teams, :id, "uuid USING id::uuid"

    add_foreign_key :matches, :tournaments  
    add_foreign_key :matches, :teams, column: :team_a_id
    add_foreign_key :matches, :teams, column: :team_b_id
  end
end
