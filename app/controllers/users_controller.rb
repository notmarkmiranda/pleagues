# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :redirect_user, only: [:new, :create]
  before_action :require_user, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.find_or_initialize_by(email: user_params[:email])
    if @user.new_record?
      @user.assign_attributes(user_params)
      return log_user_in if @user.save
    elsif @user&.authenticate(user_params[:password])
      return log_user_in
    end
    redirect_to_sign_in
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def log_user_in
    session[:user_id] = @user.id
    flash[:notice] = "Welcome!"
    redirect_to dashboard_path
  end

  def redirect_to_sign_in
    flash[:alert] = "Something went wrong"
    redirect_to sign_in_path
  end
end
