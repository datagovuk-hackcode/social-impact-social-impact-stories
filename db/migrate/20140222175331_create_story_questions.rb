class CreateStoryQuestions < ActiveRecord::Migration
  def change
    create_table :story_questions do |t|
      t.string :content
      t.integer :story_id

      t.timestamps
    end
  end
end
