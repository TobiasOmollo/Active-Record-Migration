class AddColumnToPlayers < ActiveRecord::Migration[8.1]
  def change
    add_column :players, :status, :integer
  end
end
