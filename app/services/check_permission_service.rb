class CheckPermissionService
	def initialize(current_user, params)
	  @current_user = current_user	
	  @params = params
	end

	def have_permission?
		owner = User.find(@params[:user_id]) 
		@current_user == owner || @current_user.is_admin?		
	end

	def check_permission
		have_permission? ? true : false
	end
end
