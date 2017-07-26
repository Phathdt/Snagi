class FollowService
  def initialize(params)
    @user_id = params[:user_id]
    @type = params[:type]
    @id = params[:id]
  end

  def follow
    if Follow.find_follow(@user_id, @type, @id, ).present?
      delete_follow
    else
      add_follow
    end
  end
  private

  def add_follow
    create_follow(@user_id, @type, @id)
  end

  def delete_follow
    Follow.find_follow(@user_id,@type, @id ).delete
  end

  def create_follow(user_id, type, id)
    Follow.create(followable_type: type,
                  followable_id: id,user_id: user_id)
  end
end
