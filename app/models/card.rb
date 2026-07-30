class Card < ApplicationRecord
  belongs_to :match
  belongs_to :player

  enum :card_type, { yellow: 0, red: 1 }

  validate :cannot_add_card_after_red
  validate :max_two_cards_per_player_per_match

  private

  def max_two_cards_per_player_per_match
    existing_count = Card.where(match_id: match_id, player_id: player_id).where.not(id: id).count
    if existing_count >= 2
      errors.add(:base, "A player cannot receive more than 2 cards in a single match")
    end
  end

  def cannot_add_card_after_red
    already_sent_off = Card.where(match_id: match_id, player_id: player_id, card_type: :red).where.not(id: id).exists?
    if already_sent_off
      errors.add(:base, "This player has already been sent off in this match")
    end
  end

  def apply_second_yellow_rule
    return unless card_type == "yellow"
    yellow_count = Card.where(match_id: match_id, player_id: player_id, card_type: :yellow).count
    if yellow_count == 2
      Card.create!(match: match, player: player, card_type: :red, minute: minute)
    end
  end
end