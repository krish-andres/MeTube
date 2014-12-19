class AddUserIdToPlaylists < ActiveRecord::Migration
  def change
    Playlist.delete_all
    add_column :playlists, :user_id, :integer
  end
end
