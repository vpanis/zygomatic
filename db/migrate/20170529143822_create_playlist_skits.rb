class CreatePlaylistSkits < ActiveRecord::Migration[5.0]
  def change
    create_table :playlist_skits do |t|
      t.references :playlist, foreign_key: true
      t.references :skit, foreign_key: true

      t.timestamps
    end
  end
end
