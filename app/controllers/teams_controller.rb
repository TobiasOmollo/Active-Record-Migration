class TeamsController < ApplicationController
  def new
  end

  def create
    team = Team.new(team_params)
    if team.save
      render plain: "Team created: #{team.name} (#{team.country})"
    else
      render plain: "Something went wrong: #{team.errors.full_messages.join(', ')}"
    end
  end

  private

  def team_params
    params.require(:team).permit(:name, :country)
  end
end