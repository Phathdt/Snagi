class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  before_action :authenticate_user!, except:[:index, :show]
  before_action :load_notification
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:name, :email,:password, :password_confirmation)
    end
    devise_parameter_sanitizer.permit(:account_update) do |user_params|
      user_params.permit(:name, :email,:password, :password_confirmation, :current_password)
    end
  end


  def load_notification
    if user_signed_in?
      @notifications = NotificationService.new({user_id:current_user.id}).show_notifications
    end
  end
end
