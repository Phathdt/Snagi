class UsersController < ApplicationController
  before_action :load_notification
  def index
    @users = User.where(is_active:true)
  end

  def disable_user
    p params
    SetActiveUserService.new({id:params[:id]}).set_active
  end
end
