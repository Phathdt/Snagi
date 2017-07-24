class Album < ApplicationRecord
  scope :belongs_to_user, ->(user_id){where('user_id = ?', user_id)}
  scope :not_private, ->{ where(is_private:false) }
  belongs_to :user
  has_many :pictures, dependent: :destroy

  has_many :likes, as: :likeable
  has_many :liked_users, through: :likes,source: :user

  has_many :follows, as: :followable
  has_many :followed_users, through: :follows,source: :user
end
