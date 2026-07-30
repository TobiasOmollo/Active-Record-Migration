class Goal < ApplicationRecord
  belongs_to :match
  belongs_to :scorer, class_name: "Player"
  belongs_to :assist, class_name: "Player", optional: true
  belongs_to :team

  after_save :update_match_score
  after_destroy :update_match_score

  private

  def update_match_score
    match.update(
      team_a_score: match.goals.where(team_id: match.team_a_id).count,
      team_b_score: match.goals.where(team_id: match.team_b_id).count
    )
  end
end