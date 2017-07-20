class Picture < ApplicationRecord
  belongs_to :album

  has_many :likes, as: :likeable
  has_many :liked_users, through: :likes,source: :user

  after_create :increase_album_quality
  after_destroy :decrease_ablum_quality

  has_attached_file :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  private

  def increase_album_quality
    album.increment!(:quality)
  end

  def decrease_ablum_quality
    album.decrement!(:quality)
  end
end
