class Follow < ApplicationRecord
  belongs_to :user
  belongs_to :followable, polymorphic: true

  validates_uniqueness_of :user_id, scope: [:followable_type, :followable_id]
end
