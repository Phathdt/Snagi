class PermissionService
  def initialize(params)
    @current_user = params[:current_user]
    @owner = User.find(params[:owner])
    @action = params[:action]
    @id = params[:id]
    @type = params[:type]
  end

  def have_permission?
    if @action == "index"
      return true
    elsif @action == "show"
      if @type == "Album"
        is_private = Album.find(@id).is_private?
      else
        is_private = Picture.find(@id).is_private?
      end
      is_owner_or_admin = @current_user.id == @owner.id || @current_user.is_admin?
      permission = !is_private
      return permission = permission || is_owner_or_admin
    else
      return @current_user.id == @owner.id || @current_user.is_admin?
    end
  end
end
