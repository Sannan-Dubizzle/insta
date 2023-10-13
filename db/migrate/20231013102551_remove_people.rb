class RemovePeople < ActiveRecord::Migration[7.0]
  def change
    drop_table :people
  end
end
