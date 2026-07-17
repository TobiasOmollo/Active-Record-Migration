class AddPrimaryKeyToMatches < ActiveRecord::Migration[8.1]
  def up
    execute "ALTER TABLE players ADD PRIMARY KEY (id);"
  end

  def down
    execute "ALTER TABLE players DROP CONSTRAINT players_pkey;"
  end

end
