class CreatePlayer < ActiveRecord::Migration[8.1]
  def change
    create_table :players, id:false do |t|
      t.text :code, null: false
      t.text :name, null: false
      t.date :date_of_birth, null: false
      t.text :country_of_origin, null: false

      t.timestamps
    end

    add_index :players, :code, unique: true
  end
end
