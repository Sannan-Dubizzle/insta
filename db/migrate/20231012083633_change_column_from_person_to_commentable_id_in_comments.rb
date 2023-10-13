class ChangeColumnFromPersonToCommentableIdInComments < ActiveRecord::Migration[7.0]
  def change
    rename_column :comments, :post_id, :commentable_id
  end
end
