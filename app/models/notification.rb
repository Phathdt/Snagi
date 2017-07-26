class Notification < ApplicationRecord
  belongs_to :user
  scope :count_un_readed, ->{ where(is_readed:false).count}

  validates_uniqueness_of :user_id, scope: [:user_has_id, :object_id]
end
