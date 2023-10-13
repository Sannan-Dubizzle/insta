class ChangeColumnNamesFromPersonToUser < ActiveRecord::Migration[7.0]
  def change
    rename_column :comments, :person_id, :user_id
    rename_column :friendships, :person1_id, :user1_id
    rename_column :friendships, :person2_id, :user2_id
    rename_column :posts, :person_id, :user_id
  end
end
