class AddAverageRatingToSkits < ActiveRecord::Migration[5.0]
  def change
    add_column :skits, :average_rating, :integer
  end
end
