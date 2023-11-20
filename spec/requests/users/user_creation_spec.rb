# frozen_string_literal: true

require "rails_helper"

RSpec.describe "User creation", type: :request do
  let(:user_attrs) { attributes_for(:user) }

  it "creates a user when one does not exist with that email" do
    expect do
      post "/sign-in", params: { user: user_attrs }
    end.to change(User, :count).by(1)
  end

  it "does not create a user when one exists" do
    create(:user, email: user_attrs[:email])

    expect do
      post "/sign-in", params: { user: user_attrs }
    end.to change(User, :count).by(0)
  end
end