class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  has_many :albums, dependent: :destroy
  has_many :pictures, through: :albums

  # Assocation Like
  has_many :likes
  has_many :likeables, through: :likes
  has_many :liked_pictures, through: :likes, source: :likeable, source_type: 'Picture'
  has_many :liked_albums, through: :likes, source: :likeable, source_type: 'Album'

  # Assocation Follow
  has_many :following, as: :followable, class_name: 'Follow'
  # ai dang follow toy
  has_many :following_users, through: :following, source: :user
  has_many :follows
  # toi dang follow ai
  has_many :followed_users, through: :follows, source: :followable, source_type: 'User'
  has_many :followable, through: :follows
  has_many :followed_pictures, through: :follows, source: :followable, source_type: 'Picture'
  has_many :followed_albums, through: :follows, source: :followable, source_type: 'Albums'

  # Co nhieu notification
  has_many :notifications

  has_attached_file :avatar 
  has_attached_file :wallpaper
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  validates_attachment_content_type :wallpaper, content_type: /\Aimage\/.*\z/
end
