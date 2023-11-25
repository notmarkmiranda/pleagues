class UserMailer < ApplicationMailer
  default from: "reset-no-reply@pokerleague.app"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.forgot_password.subject
  #
  def forgot_password
    user = params[:user]
    @reset_url = forgot_password_token_url(params[:sgid])

    mail to: user.email, subject: "reset password link"
  end
end
