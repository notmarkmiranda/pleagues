# frozen_string_literal: true

class LeaguesController < ApplicationController
  def show
    @league = League.find_by(uuid: params[:uuid])
  end

  def new
    @league = League.new
  end
end