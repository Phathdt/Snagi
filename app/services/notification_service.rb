class NotificationService
  MAX_NOTI = 10
  def initialize(params)
    @type = params[:type]
    @id = params[:id]
    @album = Album.find_by(id:@id)
    @album_id = params[:album_id]
  end

  def send_notifications
    user_ids = Follow.get_user_id_by(@id,@type)
    Notification.transaction do
      if @type == "Album"
        user_ids.each do |user_id|
          album = Album.find(@id)
          create_noti_album_change(user_id,@id,album.user.id)
        end
      else
        user_ids.each do |user_id|
          album = Album.find(@album_id)
          create_noti_album_create(user_id,@id,album.user.id)
        end
      end
    end
  end

  def self.count_un_read(user_id)
    Notification.find_noti(user_id).count_un_readed
  end

  def self.show_notifications(user_id)
    Notification.find_noti(user_id).last_limit(MAX_NOTI)
  end

  def self.set_readed(id)
    Notification.set_readed(id)
  end

  private

  def create_noti_album_change(user_id, id, user_has_id)
    Notification.create(user_id:user_id,
                        content: I18n.t(".noti_album_change",id: id),
                        user_has_id: user_has_id, object_id: id)
  end

  def create_noti_album_create(user_id, id, user_has_id)
    Notification.create(user_id:user_id,
                        content: I18n.t(".noti_album_create",id: id),
                        user_has_id: user_has_id, object_id: id)
  end
end
