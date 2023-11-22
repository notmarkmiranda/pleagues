# frozen_string_literal: true

require "rails_helper"

RSpec.describe "League creation", type: :request do
  before { login }
  let(:league_attrs) { attributes_for(:league) }

  it "creates a league" do
    expect do
      post "/leagues", params: {league: league_attrs}
    end.to change(League, :count).by(1)
  end

  it "calls the membership_service" do
    expect(MembershipService).to receive(:call).with({league_id: Integer, user_id: Integer, role: :super_admin}).once

    post "/leagues", params: {league: league_attrs}
  end
end
