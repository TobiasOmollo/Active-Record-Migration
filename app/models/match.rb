class Match < ApplicationRecord

  belongs_to :team_a, class_name: "Team", foreign_key: "team_a_id"
  belongs_to :team_b, class_name: "Team", foreign_key: "team_b_id"
  belongs_to :tournament, optional: true

  validates :date, :referee, :venue, presence: true

  enum :match_type, {
    friendly: "Friendly", league: "League", cup: "Cup"
  }
end
