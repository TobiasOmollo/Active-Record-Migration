class CreateTournaments < ActiveRecord::Migration[8.1]
  def change
    create_table :tournaments, id:false do |t|
      t.text :id, null:false
      t.text :name, null:false
      t.text :host_country, null:false
      t.text :year, null:false

      t.timestamps
    end
    add_index :tournaments, :id, unique:true
  end
end
