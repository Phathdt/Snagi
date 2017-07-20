class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  before_action :authenticate_user!, except:[:index, :show]
  before_action :load_notification

  protected
  def load_notification
    if user_signed_in?
      @notifications = NotificationService.new({user_id:current_user.id}).show_notifications
    end
  end
end
