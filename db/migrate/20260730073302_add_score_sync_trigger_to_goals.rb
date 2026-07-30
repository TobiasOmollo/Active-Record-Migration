class AddScoreSyncTriggerToGoals < ActiveRecord::Migration[8.1]
<<<<<<< HEAD
  def up
    execute <<~SQL
      CREATE OR REPLACE FUNCTION recalculate_match_score() RETURNS TRIGGER AS $$
      DECLARE
        target_match_id uuid;
      BEGIN
        IF TG_OP = 'DELETE' THEN
          target_match_id := OLD.match_id;
        ELSE
          target_match_id := NEW.match_id;
        END IF;
        UPDATE matches
        SET team_a_score = (SELECT COUNT(*) FROM goals WHERE match_id = target_match_id AND team_id = matches.team_a_id),
            team_b_score = (SELECT COUNT(*) FROM goals WHERE match_id = target_match_id AND team_id = matches.team_b_id)
        WHERE id = target_match_id;
        RETURN NULL;
      END;
      $$ LANGUAGE plpgsql;
    SQL

    execute <<~SQL
      CREATE TRIGGER goals_update_match_score
      AFTER INSERT OR UPDATE OR DELETE ON goals
      FOR EACH ROW EXECUTE FUNCTION recalculate_match_score();
    SQL
  end

  def down
    execute "DROP TRIGGER IF EXISTS goals_update_match_score ON goals;"
    execute "DROP FUNCTION IF EXISTS recalculate_match_score();"
=======
  def change
>>>>>>> 26f00ff (Add goals table with Goal model and score-sync callback)
  end
end
