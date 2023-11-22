# frozen_string_literal: true

require "rails_helper"

RSpec.describe MembershipService do
  let(:user) { create(:user) }
  let(:league) { create(:league) }
  subject do
    described_class.call(
      league_id: league.id,
      user_id: user.id,
      role: :superadmin
    )
  end

  it "creates a membership" do
    expect { subject }.to change(Membership, :count).by(1)
  end

  it "does not create a membership when one exists & fails silently" do
    create(:membership, league: league, user: user)

    expect { subject }.to change(Membership, :count).by(0)
  end
end