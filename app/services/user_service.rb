class UserService
  def initialize(params)
    @id = params[:id]
  end

  def set_active
    User.find(@id).toggle(:is_active).save
  end

  def delete
  	user = User.find(@id)
  	user.destroy unless user.is_admin?
  end
end