class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.references :skit, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :rating
      t.text :content

      t.timestamps
    end
  end
end
