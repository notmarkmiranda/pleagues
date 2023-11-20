class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :league
  enum role: { member: 0, admin: 1, superadmin: 2 }
  enum status: { pending: 0, active: 1, archived: 2 }
end
