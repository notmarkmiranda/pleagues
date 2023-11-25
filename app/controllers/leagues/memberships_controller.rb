# frozen_string_literal: true

module Leagues
  class MembershipsController < ::ApplicationController
    before_action :load_league

    def index
      @memberships = @league.memberships.includes(:user)
    end

    def new
      @membership = @league.memberships.new
      @membership.build_user
    end

    def create
      user = find_or_create_user
      @membership = @league.memberships.new(membership_attributes)
      @membership.user = user
      if @membership.save
        # url = @new_user? ? "reset_password_url" : "league_show_url?"
        MembershipMailer.with(user: user, league: @league).invite_to_league.deliver_later
        flash[:notice] = "invited"
      else
        flash[:alert] = "something went wrong"
      end
      redirect_to league_path(@league.uuid)
    end

    private

    def membership_params
      params.require(:membership).permit(
        :role,
        :user_id,
        :league_id,
        user_attributes: [:id, :email, :first_name, :last_name, :nickname]
      )
    end

    def load_league
      @league = League.find_by(uuid: params[:uuid])
    end

    def user_attributes
      membership_params[:user_attributes]
    end

    def membership_attributes
      membership_params.except(:user_attributes)
    end

    def find_or_create_user
      user = User.find_or_initialize_by(email: user_attributes[:email])
      if user.new_record?
        user.assign_attributes(user_attributes)
        user.set_random_password
      end
      user
    end
  end
end
