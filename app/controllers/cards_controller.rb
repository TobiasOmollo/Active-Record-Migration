class CardsController < ApplicationController
  before_action :set_match

  def index
    @cards = @match.cards.includes(:player)
  end

  def new
    @card = @match.cards.new
  end

  def create
    @card = @match.cards.new(card_params)
    if @card.save
      redirect_to match_cards_path(@match), notice: "Card recorded successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_match
    @match = Match.find(params[:match_id])
  end

  def card_params
    params.require(:card).permit(:player_id, :card_type, :minute)
  end
end