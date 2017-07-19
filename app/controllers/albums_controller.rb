class AlbumsController < ApplicationController
  before_action :set_ablum, only: [:show, :edit, :update, :destroy]
  def index
    # @albums = Album.all.page(params[:page]).per(5)
  	@albums = Album.belongs_to_user(params[:user_id])
    
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
      redirect_to user_albums_path(@album.user), notice: 'Album was successfully created.'
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
      redirect_to user_albums_path(@album.user), notice: 'Album was successfully updated.'
    else
      render 'edit'
    end
  end

  def destroy
  	@album.destroy
  	redirect_to user_albums_path(@album.user), notice: 'Album Destroy'
  end

  private
  def set_ablum
    @album = Album.find(params[:id])
    @pictures = @album.pictures
    @user = @album.user
  end

  def album_params
    params.require(:album).permit(:title, :description)
  end
end
