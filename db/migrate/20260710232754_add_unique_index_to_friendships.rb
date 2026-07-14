class AddUniqueIndexToFriendships < ActiveRecord::Migration[8.0]
  def change
    add_index :friendships, [ :user_id, :friend_id ], unique: true
  end
end
