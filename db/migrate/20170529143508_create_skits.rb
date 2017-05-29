class CreateSkits < ActiveRecord::Migration[5.0]
  def change
    create_table :skits do |t|
      t.string :name
      t.references :comedian, foreign_key: true
      t.string :video_url

      t.timestamps
    end
  end
end
