class CreateTeams < ActiveRecord::Migration[8.1]
  def change
    create_table :teams, id: false do |t|
      t.text :id, null:false
      t.text :name, null:false
      t.text :country, null:false

      t.timestamps
    end
    add_index :teams, :id, unique: true
  end
end
