class AddScoreToMatches < ActiveRecord::Migration[8.1]
  def change
    add_column :matches, :team_a_score, :integer
    add_column :matches, :team_b_score, :integer
  end
end
