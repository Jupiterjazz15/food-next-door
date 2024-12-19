Rails.application.routes.draw do
  devise_for :users

  # Splashscreen route
  root to: "pages#welcome"

  # Items routes
  resources :items, only: %i[index show new create]

  # Homepage route
  get "/homepage/:category", to: "pages#homepage", as: :homepage

  # Dashboard route
  get "/dashboard", to: "pages#dashboard"

  get "up" => "rails/health#show", as: :rails_health_check
end
