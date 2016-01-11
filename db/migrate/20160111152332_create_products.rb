class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.text :description
      t.string :image
      t.belongs_to :sub_category
      t.timestamps null: false
    end
  end
end
