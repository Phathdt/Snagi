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

end
