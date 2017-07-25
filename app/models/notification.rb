class Notification < ApplicationRecord
  belongs_to :user
  scope :count_un_readed, ->{ where(is_readed:false).count}
end
