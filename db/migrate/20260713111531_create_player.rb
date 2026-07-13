class CreatePlayer < ActiveRecord::Migration[8.1]
  def change
    create_table :players do |t|
      t.string :code
      t.string :name
      t.date :date_of_birth
      t.string :country_of_origin

      t.timestamps
    end
    add_index:palyers, :code,unique:true
  end
end
