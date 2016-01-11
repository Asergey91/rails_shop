class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.belongs_to :user
      t.belongs_to :product
      t.boolean :purchased
      t.timestamps null: false
    end
  end
end
