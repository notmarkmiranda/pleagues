# Preview all emails at http://localhost:3000/rails/mailers/membership
class MembershipPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/membership/invite_to_league
  def invite_to_league
    MembershipMailer.invite_to_league
  end
end
