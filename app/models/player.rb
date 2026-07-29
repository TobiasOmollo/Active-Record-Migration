class Player < ApplicationRecord
  enum :status, {
    active: 0,
    on_loan: 1,
    injured: 2,
  }

  has_many :match_lineups
  has_many :matches, through: :match_lineups
end
