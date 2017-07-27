class Picture < ApplicationRecord
  scope :not_private, ->{ where(is_private:false) }
  belongs_to :album

  has_many :likes, as: :likeable
  has_many :liked_users, through: :likes,source: :user

  has_many :follows, as: :followable
  has_many :followed_users, through: :follows,source: :user

  after_create :increase_album_quality
  after_destroy :decrease_ablum_quality

  has_attached_file :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates :image_file_name, presence: true 
  validates :image_content_type, presence: true 
  validates :is_private,inclusion: { in: [true, false] }

  private

  def increase_album_quality
    album.increment!(:quality)
  end

  def decrease_ablum_quality
    album.decrement!(:quality)
  end
end
