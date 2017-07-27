class User < ApplicationRecord
  scope :active,->{ where(is_active:true) }
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  has_many :albums, dependent: :destroy
  has_many :pictures, through: :albums

  # Assocation Like
  has_many :likes, dependent: :destroy
  has_many :likeables, through: :likes
  has_many :liked_pictures, through: :likes, source: :likeable, source_type: 'Picture'
  has_many :liked_albums, through: :likes, source: :likeable, source_type: 'Album'

  # Assocation Follow
  has_many :following, as: :followable, class_name: 'Follow'
  # who follow me ?
  has_many :following_users, through: :following, source: :user
  has_many :follows, :dependent => :destroy
  # me follow who ?
  has_many :followed_users, through: :follows, source: :followable, source_type: 'User'
  has_many :followable, through: :follows
  has_many :followed_pictures, through: :follows, source: :followable, source_type: 'Picture'
  has_many :followed_albums, through: :follows, source: :followable, source_type: 'Albums'

  # have many notifications
  has_many :notifications, dependent: :destroy

  has_attached_file :avatar
  has_attached_file :wallpaper
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  validates_attachment_content_type :wallpaper, content_type: /\Aimage\/.*\z/
end
