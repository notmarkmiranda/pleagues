require "rails_helper"

RSpec.describe "User can log in", type: :feature do
  context "happy paths" do
    it "allows an existing user to log in" do
      user = create(:user)

      visit "/sign-in"

      fill_in :email, with: user.email
      fill_in :password, with: "password"
      click_button "Sign In or Up"

      expect(page).to have_content("dashboard")
    end

    it "allows a new user to log in" do
      visit "/sign-in"

      fill_in :email, with: "new@email.com"
      fill_in :password, with: "password"
      click_button "Sign In or Up"

      expect(page).to have_content("dashboard")
    end
  end

  context "sad paths" do
    it "does not allow an existing user to log in with the wrong password" do
      user = create(:user)

      visit "/sign-in"

      fill_in :email, with: user.email
      fill_in :password, with: "password"
      click_button "Sign In or Up"

      expect(page).to have_content("dashboard")
    end
  end
end
