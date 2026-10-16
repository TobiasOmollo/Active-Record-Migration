class GoalsController < ApplicationController
  before_action :set_match

  def index
    @goals = @match.goals.includes(:scorer, :assist, :team)
  end

  def new
    @goal = @match.goals.new
  end

  def create
    @goal = @match.goals.new(goal_params)
    if @goal.save
      redirect_to match_goals_path(@match), notice: "Goal recorded successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_match
    @match = Match.find(params[:match_id])
  end

  def goal_params
    params.require(:goal).permit(:scorer_id, :assist_id, :team_id, :minute)
  end
end