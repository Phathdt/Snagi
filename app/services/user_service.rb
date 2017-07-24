class UserService
  def initialize(params)
    @id = params[:id]
  end

  def set_active
    User.find(@id).toggle(:is_active).save
  end

  def delete
  	User.find(@id).delete
  end
end