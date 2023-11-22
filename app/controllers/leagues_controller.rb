# frozen_string_literal: true

class LeaguesController < ApplicationController
  before_action :require_user

  def show
    @league = League.find_by(uuid: params[:uuid])
  end

  def new
    @league = League.new
  end

  def create
    @league = League.new(league_params)
    if @league.save
      MembershipService.call(league_id: @league.id, user_id: current_user.id, role: :super_admin)
      flash[:notice] = "League created!"
      redirect_to @league
    else
      flash[:alert] = @league.errors.full_messages
      render :new
    end
  end

  private

  def league_params
    params.require(:league).permit(:name, :location)
  end
end
