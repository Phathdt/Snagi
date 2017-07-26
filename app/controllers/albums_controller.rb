class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update, :destroy]
  before_action :check_permission , except: :index

  def index
    @user = User.find(params[:user_id])
    if user_signed_in?
      if current_user.id == params[:user_id].to_i || current_user.is_admin?
        @albums = Album.belongs_to_user(params[:user_id]).page(params[:page]).per(4)
      else
        @albums = Album.not_private.belongs_to_user(params[:user_id]).page(params[:page]).per(4)
      end
    else
      @albums = Album.not_private.belongs_to_user(params[:user_id]).page(params[:page]).per(4)
    end

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
      redirect_to user_album_path(current_user,@album), notice: 'Album was successfully created.'
    else
      render 'new'
    end
    respond_to do |format|
      if @album.save
        if params[:images]
          params[:images].each { |image|
            @album.pictures.create(image: image)
          }
        end
        format.html { redirect_to user_album_path(current_user,@album), notice: 'Album was successfully created.' }
        format.js
      else
        format.html { render :new }
      end
    end
  end

  def show
    if user_signed_in?
      if current_user.id == params[:user_id].to_i || current_user.is_admin?
        @pictures = @album.pictures.page(params[:page]).per(3)
      else
        @pictures = @album.pictures.where(is_private:false).page(params[:page]).per(3)
      end
    else
      @pictures = @album.pictures.where(is_private:false).page(params[:page]).per(3)
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

  def like
    LikeService.new({user_id:current_user.id,type:'Album',id:params[:id]}).like
  end

  def follow
    FollowService.new({user_id:current_user.id,type:'Album',id:params[:id]}).follow
  end

  def follow_user
    FollowService.new({user_id:current_user.id,type:'User',id:params[:id]}).follow
  end

  def set_private
    SetPrivateService.new({type:'Album',id:params[:id]}).set_private
  end

  def disable_user
    UserService.new({id:params[:user_id]}).set_active
  end
  private

  def check_permission

    permission = PermissionService.new({current_user:current_user,
                                        owner:params[:user_id],
                                        action: params[:action],
                                        id:params[:id],
                                        type:"Album"}).have_permission?
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
