class AddYoutubePathToSkits < ActiveRecord::Migration[5.0]
  def change
    add_column :skits, :youtube_path, :string
  end
end
