Rails.application.routes.draw do
  devise_for :users
  root to: "events#index"

  resources :users_controller, only: [:show]do
  #Permet d'avoir un path qui s'imbrique avec ceux de user
  resources :avatars, only: [:create] 
   end
  resources :events
  resources :charges

end
