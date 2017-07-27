class UsersController < ApplicationController
  before_action :load_notification
  def index
    @users = UserService.new(current_user: current_user).return_user
  end

  def read_notification
    notification = Notification.find(params[:id])
    NotificationService.set_readed(params[:id])
    redirect_to user_album_path(notification.user_has_id ,notification.object_id)
  end

  def disable_user
    get_user_service(params[:id]).set_active
  end

  def delete_user
    get_user_service(params[:id]).delete
  end

  private
  def get_user_service(id)
    UserService.new({id: id})
  end
end
