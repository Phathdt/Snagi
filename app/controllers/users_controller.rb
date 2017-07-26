class UsersController < ApplicationController
  before_action :load_notification
  def index
    if user_signed_in?
      if current_user.is_admin?
        @users = User.all
      else
        @users = User.active
      end
    else
      @users = User.active
    end
  end



  def read_notification
    notification = Notification.find(params[:id])
    NotificationService.set_readed(params[:id])
    redirect_to user_album_path(notification.user_has_id ,notification.object_id)
  end

  def disable_user
    UserService.new({id: params[:id]}).set_active
  end

  def delete_user
    UserService.new({id: params[:id]}).delete
  end
end
