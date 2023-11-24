Rails.application.routes.draw do
  # League
  resources :leagues, only: [:show, :new, :create], param: :uuid do
    member do
      get "/memberships", to: "leagues/memberships#index", as: "memberships"
      get "/memberships/new", to: "leagues/memberships#new", as: "new_membership"
      post "/memberships", to: "leagues/memberships#create", as: "membership"
    end
  end

  # User Sessions
  get "/sign-in", to: "users#new", as: "sign_in"
  post "/sign-in", to: "users#create"
  get "/dashboard", to: "users#show", as: "dashboard"
  delete "/sign-out", to: "sessions#destroy", as: "sign_out"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", :as => :rails_health_check

  root "home#index"
end
