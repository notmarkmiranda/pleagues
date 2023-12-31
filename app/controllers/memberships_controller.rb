# frozen_string_literal: true

class MembershipsController < ApplicationController
  before_action :require_user

  def show
    @membership = Membership.includes(:user, :league).find(params[:id]).decorate
    authorize @membership
  end

  def destroy
    @membership = Membership.includes(:league).find(params[:id])
    authorize @membership
    @membership.destroyable? ? @membership.destroy : @membership.archived!
    redirect_to memberships_league_path(@membership.league.uuid)
  end

  # Non-restful routes
  def accept
    @membership = Membership.find(params[:id])
    authorize @membership
    @membership.activate!
    redirect_to @membership
  end

  def reject
    @membership = Membership.find(params[:id])
    authorize @membership
    @membership.archive!
    redirect_to @membership
  end
end
