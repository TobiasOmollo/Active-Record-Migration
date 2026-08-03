class MatchesController < ApplicationController
  def new
  end

  def index
    @matches = Match.all
  end

  def new
    @match = Match.new
    @teams = Team.all
  end

  def create
    @match = Match.new(match_params)
    if @match.save
      redirect_to matches_path, notice: "Match created successfully."
    else
      @teams = Team.all
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @match = Match.find(params[:id])
    @teams = Team.all
  end

  def update
    @match = Match.find(params[:id])
    if @match.update(match_params)
      redirect_to matches_path, notice: "Match updated successfully."
    else
      @teams = Team.all
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def match_params
    params.require(:match).permit(:date, :match_type, :referee, :team_a_id, :team_b_id, :tournament_id, :venue)
  end
end