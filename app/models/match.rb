class Match < ApplicationRecord
  has_many :match_lineups
  has_many :players, through: :match_lineups
  has_many :cards

  belongs_to :team_a, class_name: "Team", foreign_key: "team_a_id"
  belongs_to :team_b, class_name: "Team", foreign_key: "team_b_id"
  belongs_to :tournament, optional: true
  has_many :goals

  validates :date, :referee, :venue, presence: true

  enum :match_type, {
    friendly: "Friendly", league: "League", cup: "Cup"
  }
end
