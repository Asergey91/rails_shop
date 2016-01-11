class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.belongs_to :user
      t.belongs_to :product
      t.integer :rating
      t.text :content
      t.timestamps null: false
    end
  end
end
