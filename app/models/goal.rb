class Goal < ApplicationRecord
  belongs_to :match
  belongs_to :scorer, class_name: "Player"
  belongs_to :assist, class_name: "Player", optional: true
  belongs_to :team
end