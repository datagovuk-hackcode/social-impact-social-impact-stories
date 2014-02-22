class Story < ActiveRecord::Base

  def most_recent_stories limit
    Story.order(created_at: :desc).limit limit
  end

end
