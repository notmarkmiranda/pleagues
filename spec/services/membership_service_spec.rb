# frozen_string_literal: true

require "rails_helper"

RSpec.describe MembershipService do
  let(:user) { create(:user) }
  let(:league) { create(:league) }

  it "creates a membership" do
    expect do
      described_class.call(
        league_id: league.id,
        user_id: user.id,
        role: :superadmin
      )
    end.to change(Membership, :count).by(1)
  end

  # TODO => This spec needs validation on the model as well
  it "does not create a membership when one exists & fails silently"
end