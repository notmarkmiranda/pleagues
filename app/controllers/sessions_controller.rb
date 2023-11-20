# frozen_string_literal: true

class SessionsController < ApplicationController
  def destroy
    session[:user_id] = nil
    flash[:notice] = "See ya!"
    redirect_to sign_in_path
  end
end