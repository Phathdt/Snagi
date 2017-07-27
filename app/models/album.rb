class Album < ApplicationRecord
  scope :belongs_to_user, ->(user_id){where('user_id = ?', user_id)}
  scope :not_private, ->{ where(is_private:false) }
  

  after_create :send_notification_user
  after_update :send_notification_album
  belongs_to :user
  has_many :pictures, dependent: :destroy

  has_many :likes, as: :likeable
  has_many :liked_users, through: :likes,source: :user

  has_many :follows, as: :followable
  has_many :followed_users, through: :follows,source: :user

  validates :title, presence: true
  validates :quality, numericality: { only_integer: true }
  validates :is_private,inclusion: { in: [true, false] }
  private 
  def send_notification_user
    user = self.user
    NotificationService.new({type:"User", id:user.id, album_id:id}).send_notifications 
  end

  def send_notification_album
  	NotificationService.new({type:"Album",id: id}).send_notifications	
  end
end
