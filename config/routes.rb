Rails.application.routes.draw do
  root 'users#index'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
    # resources :albums

  }
  resources :users do
    resources :albums do
      post :like
      # member do
      #   post :like
      # end
    end
    resources :pictures
  end
end
