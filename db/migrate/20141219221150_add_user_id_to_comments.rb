class AddUserIdToComments < ActiveRecord::Migration
  def change
    Comment.delete_all
    add_column :comments, :user_id, :integer
  end
end
