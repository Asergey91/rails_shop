class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.integer :integer
      t.string :string
      t.text :text

      t.timestamps null: false
    end
  end
end
