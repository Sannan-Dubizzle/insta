class AlterFriendRequests < ActiveRecord::Migration[7.0]
  def change
    rename_column :friend_requests, :user1_id, :user_id
    rename_column :friend_requests, :user2_id, :requester_id
    add_column :friend_requests, :isPending, :boolean, default: true
  end
end
