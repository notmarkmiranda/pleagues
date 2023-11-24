class ApplicationController < ActionController::Base
  include Pundit::Authorization
  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_user
    unless current_user
      session[:redirect_back] = request.path
      redirect_to sign_in_path
    end
  end

  def redirect_user
    redirect_to dashboard_path if current_user
  end

  def clear_redirect
    session[:redirect_back] = nil
  end
end
