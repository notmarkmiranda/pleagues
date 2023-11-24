# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Membership Creation", type: :request do
  let(:league) { create(:league) }
  let(:email) { "membership@creation.spec" }
  let(:membership_attrs) do
    {
      role: "admin",
      user_attributes: {
        email: email,
        first_name: "greta",
        last_name: "dean",
        nickname: "grenadine"
      }
    }
  end

  it "creates a user and membeship" do
    expect do
      post "/leagues/#{league.uuid}/memberships", params: {membership: membership_attrs}
    end.to change(Membership, :count).by(1)
      .and change(User, :count).by(1)
  end

  it "creates a membership only" do
    create(:user, email: email)
    expect do
      post "/leagues/#{league.uuid}/memberships", params: {membership: membership_attrs}
    end.to change(Membership, :count).by(1)
      .and change(User, :count).by(0)
  end
end
