Rails.application.routes.draw do
  root 'users#index'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
    # resources :albums

  }
  resources :users do
    resources :albums
    resources :pictures
  end
  # resources :albums do
  #   resources :pictures
  # end
  # resources :albums
  # resources :pictures
  # get '/users' => "users#index"
  # get '/users/:id' => "users#show", as: :user
end
