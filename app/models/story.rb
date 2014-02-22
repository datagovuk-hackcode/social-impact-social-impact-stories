class Story < ActiveRecord::Base

  belongs_to :user
  belongs_to :organisation
  belongs_to :product

  def self.most_recent_stories limit
    Story.order(created_at: :desc).limit limit
  end

end