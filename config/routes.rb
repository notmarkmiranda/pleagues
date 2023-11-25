Rails.application.routes.draw do
  # league
  resources :leagues, only: [:show, :new, :create], param: :uuid do
    member do
      get "/memberships", to: "leagues/memberships#index", as: "memberships"
      get "/memberships/new", to: "leagues/memberships#new", as: "new_membership"
      post "/memberships", to: "leagues/memberships#create", as: "membership"
    end
  end

  # user & sessions
  get "/sign-in", to: "users#new", as: "sign_in"
  post "/sign-in", to: "users#create"
  get "/dashboard", to: "users#show", as: "dashboard"
  delete "/sign-out", to: "sessions#destroy", as: "sign_out"

  # forgot password
  get "/forgot-password", to: "sessions#forgot_password", as: "forgot_password"
  post "/generate-token", to: "sessions#generate_token", as: "generate_token"
  get "/forgot-password/:token", to: "sessions#forgot_password_token", as: "forgot_password_token"
  post "/forgot-password", to: "sessions#reset_password", as: "reset_password"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", :as => :rails_health_check

  root "home#index"
end
