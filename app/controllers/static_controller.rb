class StaticController < ApplicationController
  before_filter :authenticate_user!, except: [:home_page]

  def home_page
    @most_recent_stories = Story.most_recent_stories 10
  end

end