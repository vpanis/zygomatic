class ChangeAverageRatingTypeFromSkits < ActiveRecord::Migration[5.0]
  def change
    change_column :skits, :average_rating, :float
  end
end
