class AddOtherImagesToProducts < ActiveRecord::Migration
  def change
    add_column :products, :other_images, :text
  end
end
