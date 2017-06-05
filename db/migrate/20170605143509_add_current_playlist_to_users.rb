class AddCurrentPlaylistToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :current_playlist_id, :integer
  end
end
