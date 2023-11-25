class MembershipMailer < ApplicationMailer
  default from: "invite-no-reply@pokerleague.app"

  def invite_to_league
    @user = params[:user]
    @league = params[:league]
    @url = "https://example.com/test"

    mail(to: @user.email, subject: "you've been invited!")
  end
end
