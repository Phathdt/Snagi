class LikeService
  def initialize(params)
    @user_id = params[:user_id]
    @type = params[:type]
    @id = params[:id]
  end

  def like
    if Like.where(:likeable_type => @type,
                  :likeable_id => @id,
                  :user_id => @user_id).exists?
      delete_like
    else
      add_like
    end
  end
  private

  def add_like
    Like.create(:likeable_type => @type,
                :likeable_id => @id,
                :user_id => @user_id)
  end

  def delete_like
    Like.find_by(:likeable_type => @type,
                 :likeable_id => @id,
                 :user_id => @user_id).delete
  end
end
