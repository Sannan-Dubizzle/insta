class RemovePersonFromFriendship < ActiveRecord::Migration[7.0]
  def change
    remove_column :friendships, :person1_id
    remove_column :friendships, :person2_id
  end
end
