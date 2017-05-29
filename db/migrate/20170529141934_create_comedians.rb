class CreateComedians < ActiveRecord::Migration[5.0]
  def change
    create_table :comedians do |t|
      t.string :name

      t.timestamps
    end
  end
end
