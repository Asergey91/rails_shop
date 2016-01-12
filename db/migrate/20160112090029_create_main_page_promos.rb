class CreateMainPagePromos < ActiveRecord::Migration
  def change
    create_table :main_page_promos do |t|
      t.string :title
      t.string :picture
      t.text :content
      t.string :link

      t.timestamps null: false
    end
  end
end
