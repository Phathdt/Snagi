Rails.application.routes.draw do
  root 'albums#index'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  # resources :albums do
  #   resources :pictures
  # end
  resources :albums
  resources :pictures
end
