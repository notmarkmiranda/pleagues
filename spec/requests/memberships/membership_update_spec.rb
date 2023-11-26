# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Membership update", type: :request do
  let(:membership) { create(:membership, status: :pending) }
  
  before { login(membership.user) }

  context "#accept" do
    it "updates a membership from pending to accepted" do
      expect do
        put "/memberships/#{membership.id}/accept"
      end.to change { membership.reload; membership.status }
    end

    it "doesn't update a membership when it is already active" do
      membership.active!

      expect do
        put "/memberships/#{membership.id}/accept"
      end.not_to change { membership.reload; membership.status }
    end
  end

  context "#reject" do
    it "updates a membership from pending to accepted" do
      expect do
        put "/memberships/#{membership.id}/reject"
      end.to change { membership.reload; membership.status }
    end

    it "doesn't update a membership when it is already active" do
      membership.archived!

      expect do
        put "/memberships/#{membership.id}/reject"
      end.not_to change { membership.reload; membership.status }
    end
  end
end