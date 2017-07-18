class Album < ApplicationRecord
  belongs_to :user
  has_many :pictures, dependent: :destroy
end
