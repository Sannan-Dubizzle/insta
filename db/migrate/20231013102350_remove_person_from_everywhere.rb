class RemovePersonFromEverywhere < ActiveRecord::Migration[7.0]
  def change
    remove_column :comments, :person_id
    remove_column :posts, :person_id
  end
end
