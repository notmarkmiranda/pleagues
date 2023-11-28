# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Membership.delete", type: :request do
  let(:membership) { create(:membership, status: :pending) }
  let(:admin) { create(:membership, league: membership.league, role: 1).user }

  before { login(admin) }

  context "when the membership is pending or archived" do
    it "pending - deletes a membership" do
      expect do
        delete "/memberships/#{membership.id}"
      end.to change(Membership, :count).by(-1)
    end

    it "archived - deletes a membership" do
      membership.archived!

      expect do
        delete "/memberships/#{membership.id}"
      end.to change(Membership, :count).by(-1)
    end
  end

  context "when the membership is active" do
    before { membership.active! }
    it "changes the status to archived" do
      expect do
        delete "/memberships/#{membership.id}"
      end.to change(Membership, :count).by(0)
        .and change {
               membership.reload
               membership.status
             }
    end
  end
end
