class Picture < ApplicationRecord
  belongs_to :album
  has_attached_file :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
