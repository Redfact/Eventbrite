Rails.application.routes.draw do
  devise_for :users
  root to: "events#index"

  resources :users_controller, only: [:show]do 
  resources :avatars, only: [:create] 
   end
  resources :events
  resources :charges

end
