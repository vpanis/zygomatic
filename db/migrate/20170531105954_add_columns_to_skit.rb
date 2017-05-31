class AddColumnsToSkit < ActiveRecord::Migration[5.0]
  def change
    add_column :skits, :duration, :string
    add_column :skits, :nb_of_views, :integer
    add_column :skits, :short_description, :string
    add_column :skits, :full_description, :string
    add_column :skits, :category, :string
  end
end
