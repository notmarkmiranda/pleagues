class User < ApplicationRecord
  has_secure_password
  has_many :memberships
  has_many :leagues, through: :memberships

  validates :email, presence: true, uniqueness: {case_sensitive: false}

  def role_in_league(league)
    memberships.find_by(league_id: league).role
  end

  def set_random_password
    self.password = SecureRandom.hex
  end
end
