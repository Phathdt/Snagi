class UsersController < ApplicationController
  before_action :load_notification
  def index
    @users = User.where(is_active:true)
  end

  def disable
    if current_user.is_admin?
    	a = User.find(params[:id])
    	a.toggle(:is_active).save
    end
  end
end
