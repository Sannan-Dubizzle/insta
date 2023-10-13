class CreateFriendships < ActiveRecord::Migration[7.0]
  def change
    create_table :friendships do |t|
      t.references :person1, foreign_key: { to_table: :people}
      t.references :person2, foreign_key: { to_table: :people}

      t.timestamps
    end
  end
end
