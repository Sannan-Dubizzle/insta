class CreateFriendRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :friend_requests do |t|
      t.references :user1, foreign_key: { to_table: :users}
      t.references :user2, foreign_key: { to_table: :users}

      t.timestamps
    end
  end
end
