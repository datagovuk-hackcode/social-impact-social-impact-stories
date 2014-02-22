class CreateStoryQuestionResponses < ActiveRecord::Migration
  def change
    create_table :story_question_responses do |t|
      t.boolean :value
      t.integer :story_question_id
      t.integer :user_id

      t.timestamps
    end
  end
end
