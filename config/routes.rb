Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  resources :categories, only: [:index, :create]
  resources :entries, only: [:new, :create]
  resources :reports, only: [:index]
end
