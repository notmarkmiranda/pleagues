class MembershipMailer < ApplicationMailer
  default from: "invite-no-reply@pokerleague.app"

  def invite_to_league
    @user = params[:user]
    @league = params[:league]
    @url = params[:url]

    mail(to: @user.email, subject: "you've been invited!")
  end
end
