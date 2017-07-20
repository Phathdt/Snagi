class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]
  before_action :check_permission
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

  def set_private
    SetPrivateService.new({type:'Picture',id:params[:id]}).set_private
  end

  private

  def check_permission
    permission = PermissionService.new({current_user:current_user,
                                        owner:params[:user_id],
                                        action: params[:action],
                                        id:params[:id]}).have_permission?
    puts permission
    redirect_to root_path unless permission
  end


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
