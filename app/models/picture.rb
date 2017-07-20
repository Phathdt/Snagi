class Picture < ApplicationRecord
  belongs_to :album

  has_many :likes, as: :likeable
  has_many :liked_users, through: :likes,source: :user
 
  has_attached_file :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
