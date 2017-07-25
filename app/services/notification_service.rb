class NotificationService
  def initialize(params)
    @type = params[:type]
    @id = params[:id]
    @album = Album.find_by(id:@id)
  end

  def send_notifications
    user_ids = Follow.where("followable_id = ? AND followable_type = ? ", @id, @type).pluck(:user_id)
    Notification.transaction do
    	user_ids.each do |user_id|
    		Notification.create(user_id:user_id, content:"Album #{@id} change", object_type: "Album", object_id: @id)
    	end
    end
  end

  def self.count_un_read(user_id)
  	Notification.where(user_id:user_id).count_un_readed
  end

  def self.show_notifications(user_id)
    Notification.where(user_id:user_id).last(10)
  end

  def self.set_readed(id)
    Notification.where(id:id).update(is_readed:true)
  end
end
