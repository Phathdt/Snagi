class NotificationService
	def initialize(params)
	  @user_id = params[:user_id]
	end

	def show_notifications
		Notification.where(user_id:@user_id)
	end

	def set_as_readed(id)
		Notification.where(id:id).update(is_readed:true)
	end
end