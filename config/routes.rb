Rails.application.routes.draw do
  get 'users_controller/view'
  get 'events_controller/index'
  get 'static_pages/index'
  devise_for :users
  root to: "events_controller#index"

  resources :users, only: [:view]
end
