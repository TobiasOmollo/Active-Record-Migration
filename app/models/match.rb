class Match < ApplicationRecord
  self.primary_key = :id
  before_create :set_uuid

  belongs_to :team_a, class_name: "Team", foreign_key: "team_a_id"
  belongs_to :team_b, class_name: "Team", foreign_key: "team_b_id"
  belongs_to :tournament, optional: true
  private

  def set_uuid
    self.id = SecureRandom.uuid if id.blank?
  end
end
