class StaticController < ApplicationController
  before_filter :authenticate_user!, except: [:home_page]
end

def home_page
end