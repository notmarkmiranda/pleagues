# frozen_string_literal: true

class MembershipService
  def self.call(league_id:, user_id:, role: :member, status: :pending)
    Membership.create(league_id: league_id, user_id: user_id, role: role, status: status)
  end
end
