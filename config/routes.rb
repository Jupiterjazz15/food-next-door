Rails.application.routes.draw do
  devise_for :users

  # Splashscreen route
  root to: "pages#welcome"

  # Items routes
  resources :items, only: %i[index show new create]

  # Homepage routes
  get "/homepage_food", to: "pages#homepage_food", as: :homepage_food
  get "/homepage_home", to: "pages#homepage_home", as: :homepage_home

  # Dashboard route
  get "/dashboard", to: "pages#dashboard"

  get "up" => "rails/health#show", as: :rails_health_check
end
