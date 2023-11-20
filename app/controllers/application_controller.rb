class ApplicationController < ActionController::Base
  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_user
    redirect_to sign_in_path unless current_user
  end

  def redirect_user
    redirect_to dashboard_path if current_user
  end
end
