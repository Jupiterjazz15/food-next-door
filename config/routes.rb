Rails.application.routes.draw do
  devise_for :users

  root to: "pages#welcome"
  resources :items, only: %i[index show new create]

  get "/home", to: "pages#home"
  get "/dashboard", to: "pages#dashboard"
  get "up" => "rails/health#show", as: :rails_health_check
end
