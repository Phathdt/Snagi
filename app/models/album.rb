class Album < ApplicationRecord
  scope :belongs_to_user, ->(user_id){where('user_id = ?', user_id)}
  belongs_to :user
  has_many :pictures, dependent: :destroy
end
