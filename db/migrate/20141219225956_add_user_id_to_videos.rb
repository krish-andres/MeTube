class AddUserIdToVideos < ActiveRecord::Migration
  def change
    Video.delete_all
    add_column :videos, :user_id, :integer
  end
end
