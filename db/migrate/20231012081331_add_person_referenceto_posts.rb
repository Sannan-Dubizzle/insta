class AddPersonReferencetoPosts < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :person, foreign_key: true
  end
end
