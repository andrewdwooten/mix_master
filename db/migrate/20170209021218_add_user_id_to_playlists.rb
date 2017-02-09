class AddUserIdToPlaylists < ActiveRecord::Migration[5.0]
  def change
    add_column :playlists, :user, :references
  end
end
