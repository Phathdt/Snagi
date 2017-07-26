class Follow < ApplicationRecord
  scope :find_follow, ->(user_id, type, id){find_by(followable_type: type,
                                                    followable_id: id, user_id: user_id)}
  scope :get_user_id_by, ->(id, type){ where("followable_id = ? AND followable_type = ? ",
                                             id, type).pluck(:user_id)}
  belongs_to :user
  belongs_to :followable, polymorphic: true

  validates_uniqueness_of :user_id, scope: [:followable_type, :followable_id]
end
