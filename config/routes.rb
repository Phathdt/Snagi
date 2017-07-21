Rails.application.routes.draw do
  root 'users#index'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resources :users do
    member do
      post :disable
    end
    resources :albums do
      # post :like
      member do
        post :like, :follow, :follow_user, :set_private
      end
    end
    resources :pictures do
      member do
        post :like, :follow, :set_private
      end
    end

    resources :notifications
  end
end
