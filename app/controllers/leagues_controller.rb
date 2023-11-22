# frozen_string_literal: true

class LeaguesController < ApplicationController
  def show
    @league = League.find(params[:id])
  end
end