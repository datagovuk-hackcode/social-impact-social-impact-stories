class Story < ActiveRecord::Base

  belongs_to :user
  belongs_to :organisation
  belongs_to :product

  has_many :story_questions
  has_many :relatabilities
  has_many :photos

  validates_presence_of :organisation
  validates_presence_of :user

  def self.most_recent_stories limit
    Story.order(created_at: :desc).limit limit
  end

  def positive_relatability_count
    self.relatabilities.where(value: true).count
  end

  def negative_relatability_count
    self.relatabilities.where(value: false).count
  end

end