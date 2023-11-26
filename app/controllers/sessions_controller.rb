# frozen_string_literal: true

class SessionsController < ApplicationController
  before_action :redirect_user, except: [:destroy]

  def forgot_password
    # session[:redirect_back] = params[:redirect]
  end

  def generate_token
    user = User.find_by(email: params[:email])
    if user
      UserMailer.with(user: user, sgid: token(user), redirect_back: params[:redirect_back]).forgot_password.deliver_now
    end
    flash[:alert] = "password reset instructions will be sent to this email if it exists in our system"
    redirect_to forgot_password_path
  end

  def reset_password
    user = GlobalID::Locator.locate_signed(params[:user_token], for: 'reset_password')
    if user&.update(user_params)
      flash[:notice] = "password updated"
      session[:redirect_back] = params[:redirect_back]
      redirect_to sign_in_path(redirect_back: params[:redirect_back])
    else
      flash[:alert] = "something went wrong"
      redirect_to forgot_password_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "See ya!"
    redirect_to sign_in_path
  end

  private

  def user_params
    params.permit(:password)
  end

  def token(user)
    user.to_sgid(expires_in: 15.minutes, for: "reset_password")
  end
end
