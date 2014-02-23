class CreateRelatabilities < ActiveRecord::Migration
  def change
    create_table :relatabilities do |t|
      t.boolean :value
      t.text :comment
      t.integer :user_id
      t.integer :story_id

      t.timestamps
    end
  end
end
