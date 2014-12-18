class MakeCommentsPolymorphic < ActiveRecord::Migration

  def up
    Comment.delete_all
    remove_column :comments, :video_id
    add_column :comments, :commentable_id, :integer
    add_column :comments, :commentable_type, :string
  end

  def down
    Comment.delete_all
    remove_column :comments, :commentable_type
    remove_column :comments, :commentable_id
    add_column :comments, :video_id, :integer
  end
end
