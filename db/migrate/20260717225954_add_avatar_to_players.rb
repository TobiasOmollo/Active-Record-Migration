class AddAvatarToPlayers < ActiveRecord::Migration[8.1]
  def change
    add_column :players, :avatar, :text
  end
end
