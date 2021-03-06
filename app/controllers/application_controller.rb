class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  before_action :authenticate_user!, except:[:index, :show]
  before_action :load_notification, :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:name, :email,:password, :password_confirmation)
    end
    devise_parameter_sanitizer.permit(:account_update) do |user_params|
      user_params.permit(:name, :email,:password, :password_confirmation, :current_password, :avatar, :wallpaper)
    end
  end


  def load_notification
    if user_signed_in?
      @count_un_read_notification = NotificationService. count_un_read(current_user.id)
      @notifications = NotificationService.show_notifications(current_user.id)
    end
  end


  private

  def set_locale
    I18n.locale = params[:locale] if params[:locale].present?
  end

  def default_url_options(options={})
    {locale: I18n.locale}
  end
end
