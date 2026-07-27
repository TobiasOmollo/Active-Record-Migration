class PlayersController < ApplicationController
  def new
  end

  def create
    player = Player.new(player_params)
    if player.save
      render plain: "Player created: #{player.name}, code #{player.code}"
    else
      render plain: "Something went wrong: #{player.errors.full_messages.join(', ')}"
    end
  end

  private

  def player_params
    params.require(:player).permit(:name, :code, :country_of_origin, :date_of_birth, :status)
  end
end