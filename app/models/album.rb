class Album < ApplicationRecord
  scope :belongs_to_user, ->(user_id){where('user_id = ?', user_id)}
  scope :not_private, ->{ where(is_private:false) }

  after_update :send_notification
  belongs_to :user
  has_many :pictures, dependent: :destroy

  has_many :likes, as: :likeable
  has_many :liked_users, through: :likes,source: :user

  has_many :follows, as: :followable
  has_many :followed_users, through: :follows,source: :user

  private 
  def send_notification
  	NotificationService.new({type:"Album",id: id}).send_notifications	
  end
end
