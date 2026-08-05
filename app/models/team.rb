class Team < ApplicationRecord
  validates :name, presence: true
  validates :country, presence: true
  
  has_many :match_lineups 
  has_many :managers
end
