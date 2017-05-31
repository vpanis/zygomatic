class AddColumnsToComedian < ActiveRecord::Migration[5.0]
  def change
    add_column :comedians, :short_description, :string
    add_column :comedians, :full_description, :string
  end
end
