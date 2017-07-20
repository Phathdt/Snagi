class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]
  def update
    if @picture.update(picture_params)
      redirect_to [@user, @picture]
    else
      render 'edit'
    end
  end

  def destroy
    @picture.destroy
    redirect_to [@user,@album]
  end

  def like
    LikeService.new({user_id:current_user.id,type:'Picture',id:params[:id]}).like
  end

  private

  def set_picture
    @picture = Picture.find(params[:id])
    @album = @picture.album
    @user = @album.user
    @current_user = current_user
  end

  def picture_params
    params.require(:picture).permit(:title, :description)
  end
end
