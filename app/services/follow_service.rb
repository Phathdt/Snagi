class FollowService
  def initialize(params)
    @user_id = params[:user_id]
    @type = params[:type]
    @id = params[:id]
  end

  def follow
    if Follow.where(:followable_type => @type,
                  :followable_id => @id,
                  :user_id => @user_id).exists?
      delete_follow
    else
      add_follow
    end
  end
  private

  def add_follow
    Follow.create(:followable_type => @type,
                :followable_id => @id,
                :user_id => @user_id)
  end

  def delete_follow
    Follow.find_by(:followable_type => @type,
                 :followable_id => @id,
                 :user_id => @user_id).delete
  end
end
