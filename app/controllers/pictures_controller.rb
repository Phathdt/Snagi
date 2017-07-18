class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]
  def update
    if @picture.update(picture_params)
      redirect_to @picture
    else
      render 'edit'
    end
  end

  def destroy
    @picture.destroy
    redirect_to @album
  end

  private

  def set_picture
    @picture = Picture.find(params[:id])
    @album = @picture.album
  end

  def picture_params
    params.require(:picture).permit(:title, :description)
  end
end
