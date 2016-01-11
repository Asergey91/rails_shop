class CreateSubCategories < ActiveRecord::Migration
  def change
    create_table :sub_categories do |t|
      t.belongs_to :category
      t.string :name
      t.timestamps null: false
    end
  end
end
