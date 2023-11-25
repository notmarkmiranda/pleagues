require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "forgot_password" do
    let(:user) { create(:user) }
    let(:mail) { UserMailer.with(user: user, sgid: "asdf").forgot_password }

    it "renders the headers" do
      expect(mail.subject).to eq("reset password link")
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(["reset-no-reply@pokerleague.app"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to include("did you forget your password, silly billy?")
    end
  end
end
