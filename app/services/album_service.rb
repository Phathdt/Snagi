class AlbumService
  PAGE_PAGINATE = 4
  PICTURE = 3
  attr_reader :signed_in, :current_user, :user_id, :page, :album
  def initialize(params)
    @user_id = params[:user_id]
    @current_user = params[:current_user]
    @signed_in = params[:signed_in]
    @page = params[:page]
    @album = params[:album]
  end

  def return_albums
    if signed_in == true
      if current_user.id == user_id || current_user.is_admin?
        return Album.belongs_to_user(user_id).page(page).per(PAGE_PAGINATE)
      else
        return Album.not_private.belongs_to_user(user_id).page(page).per(PAGE_PAGINATE)
      end
    else
      return Album.not_private.belongs_to_user(user_id).page(page).per(PAGE_PAGINATE)
    end
  end

  def return_pictures
    if signed_in == true
      if current_user.id == user_id || current_user.is_admin?
        return album.pictures.page(page).per(PICTURE)
      else
        return album.pictures.not_private.page(page).per(PICTURE)
      end
    else
      return album.pictures.not_private.page(page).per(PICTURE)
    end
  end

  def self.add_picture(album, images)
    images.each { |image| album.pictures.create(image: image) }
  end
end
