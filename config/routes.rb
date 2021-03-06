Rails.application.routes.draw do
  root 'users#index'
  scope ":locale", locale:/en|vn/ do
    devise_for :users, controllers: {
      sessions: 'users/sessions'
    }
    resources :users do
      member do
        post :disable_user, :delete_user, :read_notification
      end
      resources :albums do
        # post :like
        member do
          post :like, :follow, :follow_user, :set_private , :disable_user
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
end
