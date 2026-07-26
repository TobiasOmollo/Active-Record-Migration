class CreateManagers < ActiveRecord::Migration[8.1]
  def change
    create_table :managers, id:false do |t|
      t.text :id, null:false
      t.text :name, null:false

      t.timestamps
    end
    add_index :managers, :id, unique:true
  end
end
