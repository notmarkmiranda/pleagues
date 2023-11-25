require "rails_helper"

RSpec.describe MembershipMailer, type: :mailer do
  describe "invite_to_league" do
    let(:user) { create(:user) }
    let(:league) { create(:league) }
    let(:mail) { MembershipMailer.with(user: user, league: league).invite_to_league }

    it "renders the headers" do
      expect(mail.subject).to eq("you've been invited!")
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(["invite-no-reply@pokerleague.app"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to include("oh hey, friend! you've been invited to join #{league.name}")
    end
  end
end
