class StoryQuestion < ActiveRecord::Base

  belongs_to :story
  has_many :story_question_responses

  validates_presence_of :story

end
