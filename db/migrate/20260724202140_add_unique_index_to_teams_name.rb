class AddUniqueIndexToTeamsName < ActiveRecord::Migration[8.1]
  def change
    add_index :teams, :name, unique: true
  end
end
