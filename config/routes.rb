Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  resources :categories, only: [:index, :new, :create]
end
