# frozen_string_literal: true

class League < ApplicationRecord
  validates :name, presence: true, uniqueness: {case_sensitive: false}
  has_many :memberships
  has_many :users, through: :memberships

  def owner_name
    memberships.includes(:user).find_by(role: :superadmin).user.email
  end
end
