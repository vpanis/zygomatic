class AddSkitPositionToPlaylistSkits < ActiveRecord::Migration[5.0]
  def change
    add_column :playlist_skits, :skit_position, :integer
  end
end
