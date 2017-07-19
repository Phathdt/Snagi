class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update, :destroy]
  before_action :check_permission, except: [:index, :show]
  def index
    # @albums = Album.all.page(params[:page]).per(5)
    @albums = Album.belongs_to_user(params[:user_id]).page(params[:page]).per(5)

  end

  def new
    @album = Album.new
    @user = current_user
  end

  def create
    @album = current_user.albums.build(album_params)
    if @album.save
      if params[:images]
        params[:images].each { |image|
          @album.pictures.create(image: image)
        }
      end
      redirect_to user_album_path(@user,@album), notice: 'Album was successfully created.'
    else
      render 'new'
    end
  end

  def update
    if @album.update(album_params)
      if params[:images]
        params[:images].each { |image|
          @album.pictures.create(image: image)
        }
      end
      redirect_to user_album_path(@user,@album), notice: 'Album was successfully updated.'
    else
      render 'edit'
    end
  end

  def destroy
    @album.destroy
    redirect_to user_albums_path(@album.user), notice: 'Album Destroy'
  end

  private
  def set_album
    @album = Album.find(params[:id])
    @pictures = @album.pictures
    @user = @album.user
  end

  def album_params
    params.require(:album).permit(:title, :description)
  end

  def have_permission?
    permission = current_user == User.find(params[:user_id]) || current_user.is_admin? ? true : false
  end

  def check_permission
    unless have_permission?
      redirect_to root_path, notice: 'dont have permission'      
    end
  end
end
