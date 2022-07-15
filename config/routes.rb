Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  resources :events
  resources :rsvps, only: [:create]

  root "events#index"
end
