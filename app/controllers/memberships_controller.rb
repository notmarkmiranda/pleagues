# frozen_string_literal: true

class MembershipsController < ApplicationController
  def show
    @membership = Membership.includes(:user, :league).find(params[:id]).decorate
    # authorize @membership
  end
end