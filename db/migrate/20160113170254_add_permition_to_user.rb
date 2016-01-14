class AddPermitionToUser < ActiveRecord::Migration
  def change
    add_column :users, :permition, :integer
  end
end
