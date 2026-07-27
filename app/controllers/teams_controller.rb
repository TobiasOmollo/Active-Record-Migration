class TeamsController < ApplicationController
  def new
  end
  #Returns the entries in the teams table
  def index
    @teams = Team.all
    render plain: @teams.map { |t| "#{t.name} (#{t.country})" }.join("\n")
  end
  #Creates an object to the team model class
  def create
    team = Team.new(team_params)
    if team.save
      render plain: "Team created: #{team.name} (#{team.country})"
    else
      render plain: "Something went wrong: #{team.errors.full_messages.join(', ')}"
    end
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    if @team.update(team_params)
      flash[:notice] = "Team updated successfully!"
      redirect_to edit_team_path(@team)
    else
      flash.now[:alert] = @team.errors.full_messages.join(", ")
      render :edit, status: :unprocessable_entity
    end
  end

  private
  #Contains the data entered from the form
  def team_params
    params.require(:team).permit(:name, :country)
  end
end