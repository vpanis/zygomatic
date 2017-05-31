class RemoveVideoUrlFromSkits < ActiveRecord::Migration[5.0]
  def change
    remove_column :skits, :video_url, :string
  end
end
