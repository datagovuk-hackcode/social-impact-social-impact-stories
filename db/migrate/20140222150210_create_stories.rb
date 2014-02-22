class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.text :title
      t.text :content

      t.integer :user_id
      t.integer :organisation_id
      t.integer :product_id

      t.timestamps
    end
  end
end
