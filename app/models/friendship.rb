class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: "User"

  validates :friend_id, uniqueness: { scope: :user_id }
  validate :cannot_friend_to_self

  private
  def cannot_friend_to_self
    if friend_id == user_id
      errors.add(:friend_id, "cannot be yourself")
    end
  end
end
