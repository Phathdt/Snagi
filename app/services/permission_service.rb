class PermissionService
  def initialize(params)
    @current_user = params[:current_user]
    @owner = User.find(params[:owner])
    @action = params[:action]
    @id = params[:id]
    @type = params[:type]
    @current_user ||= User.new
  end

  def have_permission?
    if @action == "index"
      return true
    elsif @action == "show"
      if @type == "Album"
        is_private = Album.find(@id).is_private?
        p is_private
      else
        picture = Picture.find(@id)
        is_private = picture.is_private?
        is_private = picture.album.is_private? ? true : is_private
      end
      is_owner_or_admin = @current_user.id == @owner.id || @current_user.is_admin?
      permission = !is_private
      return permission = permission || is_owner_or_admin
    else
      return @current_user.id == @owner.id || @current_user.is_admin?
    end
  end
end
