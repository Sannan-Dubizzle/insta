class AddUserIdReferencesInFriendship < ActiveRecord::Migration[7.0]
  def change
    add_reference :friendships, :user1, foreign_key: { to_table: :users}
    add_reference :friendships, :user2, foreign_key: { to_table: :users}
  end
end
