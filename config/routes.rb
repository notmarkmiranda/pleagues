Rails.application.routes.draw do
  # League
  resources :leagues, only: [:show], param: :uuid

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
