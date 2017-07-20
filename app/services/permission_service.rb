class PermissionService
  def initialize(current_user, params, is_private)
    @current_user = current_user
    @params = params
    @is_private = is_private
  end

  def have_permission?
    owner = User.find(@params[:user_id])
    @current_user == owner || @is_private || @current_user.is_admin?
  end
end
