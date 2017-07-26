class Notification < ApplicationRecord
  belongs_to :user
  scope :count_un_readed, ->{ where(is_readed:false).size}
  scope :find_noti, ->(user_id){ where(user_id: user_id)}
  scope :last_limit, ->(limit){ last(limit)}
  scope :set_readed, ->(id) { find(id).update(is_readed: true)}
  validates_uniqueness_of :user_id, scope: [:user_has_id, :object_id, :is_readed]
end
