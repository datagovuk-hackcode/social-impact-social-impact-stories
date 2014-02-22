class Story < ActiveRecord::Base

  belongs_to :user
  belongs_to :organisation
  belongs_to :product

  has_many :story_questions

  validates_presence_of :organisation
  validates_presence_of :user

  def self.most_recent_stories limit
    Story.order(created_at: :desc).limit limit
  end

end