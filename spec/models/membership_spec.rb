# frozen_string_literal: true

require "rails_helper"

RSpec.describe Membership, type: :model do
  before { create(:membership) }
  it { should belong_to :user }
  it { should belong_to :league }
  it { should validate_uniqueness_of(:user_id).scoped_to(:league_id) }
  it { should define_enum_for(:role).with_values({member: 0, admin: 1, superadmin: 2}) }
  it { should define_enum_for(:status).with_values({pending: 0, active: 1, archived: 2}) }
end
