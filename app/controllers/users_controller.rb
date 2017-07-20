class UsersController < ApplicationController
  before_action :load_notification
  def index
    @users = User.all
  end  
end
