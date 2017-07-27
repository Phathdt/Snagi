class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update, :destroy]
  before_action :check_permission , except: :index

  def index
    @albums = AlbumService.new({user_id: params[:user_id].to_i,
                                current_user: current_user,
                                signed_in: user_signed_in?,
                                page: params[:page]}).return_albums
    @user = User.find(params[:user_id])
  end

  def new
    @album = Album.new
    @user = current_user
  end

  def create
    @album = current_user.albums.build(album_params)
    if @album.save
      AlbumService.add_picture(@album,params[:images]) if params[:images]
      redirect_to user_album_path(current_user,@album), notice: I18n.t(".album_create")
    else
      redirect_to new_user_album_path(params[:user_id]), notice: I18n.t(".album_fail")
    end
  end

  def show
    signed_in = user_signed_in? ? true : false

    @pictures = AlbumService.new({user_id: params[:user_id].to_i,
                                  current_user: current_user,
                                  signed_in: signed_in,
                                  page: params[:page],
                                  album: @album}).return_pictures
  end

  def update
    if @album.update(album_params)
      AlbumService.add_picture(@album,params[:images]) if params[:images]
      redirect_to user_album_path(@user,@album), notice: I18n.t(".album_update")
    else
      redirect_to edit_user_album_path(params[:user_id],@album), notice: I18n.t(".album_fail")
    end
  end

  def destroy
    @album.destroy
    redirect_to user_albums_path(@album.user), notice: I18n.t(".album_destroy")
  end

  def like
    LikeService.new({user_id: current_user.id,
                     type: 'Album',id: params[:id]}).like
  end

  def follow
    FollowService.new({user_id: current_user.id,
                       type:' Album',id: params[:id]}).follow
  end

  def follow_user
    FollowService.new({user_id: current_user.id,
                       type: 'User',id: params[:id]}).follow
  end

  def set_private
    SetPrivateService.new({type: 'Album',
                           id: params[:id]}).set_private
  end

  def disable_user
    UserService.new({id: params[:user_id]}).set_active
  end
  private

  def check_permission

    permission = PermissionService.new({current_user: current_user,
                                        owner: params[:user_id],
                                        action: params[:action],
                                        id: params[:id],
                                        type: "Album"}).have_permission?
    redirect_to root_path unless permission
  end

  def set_album
    @album = Album.find(params[:id])
    @pictures = @album.pictures
    @user = User.find(params[:user_id])
    @current_user = current_user
  end

  def album_params
    params.require(:album).permit(:title, :description)
  end
end
