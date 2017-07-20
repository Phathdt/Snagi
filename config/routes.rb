Rails.application.routes.draw do
  root 'users#index'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resources :users do
    resources :albums do
      # post :like
      member do
        post :like, :set_private
      end
    end
    resources :pictures do
      member do
        post :like, :set_private
      end
    end
  end
end
