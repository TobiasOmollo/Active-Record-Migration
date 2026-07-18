class FixPlayersPrimaryKey < ActiveRecord::Migration[8.1]
  def up
    change_column_null :players, :code, false
    execute "ALTER TABLE players DROP CONSTRAINT players_pkey;"
    remove_column :players, :id
    execute "ALTER TABLE players ADD PRIMARY KEY (code);"
  end

  def down
    execute "ALTER TABLE players DROP CONSTRAINT players_pkey;"
    add_column :players, :id, :bigserial
    change_column_null :players, :code, true
  end
end
