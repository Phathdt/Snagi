class UsersController < ApplicationController
  before_action :load_notification
  def index
    if user_signed_in?
      if current_user.is_admin?
        @users = User.all
      else
        @users = User.where(is_active:true)
      end
    else
      @users = User.where(is_active:true)
    end
  end

  def disable_user
    UserService.new({id:params[:id]}).set_active
  end

  def delete_user
    UserService.new({id:params[:id]}).delete
  end
end
