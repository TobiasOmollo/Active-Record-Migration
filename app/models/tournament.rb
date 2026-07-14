class Tournament < ApplicationRecord
  self.primary_key = :id
  before_create :set_uuid

  private

  def set_uuid
    self.id = SecureRandom.uuid if id.blank?
  end
end