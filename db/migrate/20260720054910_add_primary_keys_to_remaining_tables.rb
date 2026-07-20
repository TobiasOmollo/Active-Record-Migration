class AddPrimaryKeysToRemainingTables < ActiveRecord::Migration[8.1]
  def up
    execute "ALTER TABLE teams ADD PRIMARY KEY (id);"
    execute "ALTER TABLE managers ADD PRIMARY KEY (id);"
    execute "ALTER TABLE tournaments ADD PRIMARY KEY (id);"
    execute "ALTER TABLE matches ADD PRIMARY KEY (id);"
  end

  def down
    execute "ALTER TABLE teams DROP CONSTRAINT teams_pkey;"
    execute "ALTER TABLE managers DROP CONSTRAINT managers_pkey;"
    execute "ALTER TABLE tournaments DROP CONSTRAINT tournaments_pkey;"
    execute "ALTER TABLE matches DROP CONSTRAINT matches_pkey;"
  end
end
