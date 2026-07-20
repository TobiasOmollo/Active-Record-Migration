class Match < ApplicationRecord

  belongs_to :team_a, class_name: "Team", foreign_key: "team_a_id"
  belongs_to :team_b, class_name: "Team", foreign_key: "team_b_id"
  belongs_to :tournament, optional: true

  enum :match_type, {
    other: "other", euro: "euro", world_cup: "world_cup"
  }
end
