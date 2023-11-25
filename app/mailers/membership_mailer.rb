class MembershipMailer < ApplicationMailer
  default from: "invite-no-reply@pokerleague.app"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.membership_mailer.invite_to_league.subject
  #
  def invite_to_league
    @user = params[:user]
    @league = params[:league]
    @url = "https://example.com/test"

    mail(to: @user.email, subject: "You've been invited!")
  end
end
