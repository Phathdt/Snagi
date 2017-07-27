class UserService
  attr_accessor :current_user
  def initialize(params)
    @id = params[:id]
    @current_user = params[:current_user]
  end

  def set_active
    User.find(@id).toggle(:is_active).save
  end

  def delete
  	user = User.find(@id)
  	user.destroy unless user.is_admin?
  end

  def return_user
    if current_user == nil
      return User.active
    else
      return current_user.is_admin? ? User.all : User.active
    end
  end
end