class Card < ApplicationRecord
  belongs_to :match
  belongs_to :player

  enum :card_type, { yellow: 0, red: 1 }

  validate :player_sent_off
  validate :card_type_limit_exceeded

  after_create :issue_automatic_red_on_second_yellow

  private
  def other_cards_for_same_player_in_match
    Card.where(match_id: match_id, player_id: player_id).where.not(id: id)
  end

  def player_sent_off
    return unless other_cards_for_same_player_in_match.red.exists?
    errors.add(:base, "This player has already been sent off in this match")
  end
  
  def card_type_limit_exceeded
    cards_of_same_type = other_cards_for_same_player_in_match.where(card_type: card_type).count

    if yellow? && cards_of_same_type >= 2
      errors.add(:base, "A player cannot receive more than 2 yellow cards in a single match")
    elsif red? && cards_of_same_type >= 1
      errors.add(:base, "A player cannot receive more than 1 red card in a single match")
    end
  end

  def issue_automatic_red_on_second_yellow
    return unless yellow?
    return unless Card.where(match: match, player: player, card_type: :yellow).count == 2
    Card.create!( match: match, player: player, card_type: :red, minute: minute )
  end
end