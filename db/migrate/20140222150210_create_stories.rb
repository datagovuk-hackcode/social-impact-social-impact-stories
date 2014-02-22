class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.text :content
      t.integer :user_id
      t.integer :company_id
      t.integer :product_id

      t.timestamps
    end
  end
end
