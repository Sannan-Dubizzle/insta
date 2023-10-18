class ChangeFriendIdtoRequesterIdInRequests < ActiveRecord::Migration[7.0]
  def change
    rename_column :friend_requests, :friend_id, :requester_id
    add_column :friend_requests, :isPending, :boolean, default: true
  end
end
