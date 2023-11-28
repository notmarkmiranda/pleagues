class Membership < ApplicationRecord
  belongs_to :user
  accepts_nested_attributes_for :user
  belongs_to :league
  enum role: {member: 0, admin: 1, superadmin: 2}
  enum status: {pending: 0, active: 1, archived: 2}

  delegate :email, to: :user, prefix: true
  delegate :name, to: :league, prefix: true

  validates :user_id, uniqueness: {scope: :league_id}

  def self.available_roles
    roles.except(:superadmin).keys
  end

  def activate!
    active! && update(accepted_at: DateTime.current)
  end

  def archive!
    archived! && update(accepted_at: nil)
  end

  def destroyable?
    !active?
  end
end
