Rails.application.routes.draw do
  devise_for :users
  root to: "events#index"

  resources :users_controller, only: [:show]
  resources :events
  resources :charges
  
end
