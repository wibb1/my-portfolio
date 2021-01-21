class PagesController < ApplicationController
  require './lib/apis/news_api.rb' 
  require './lib/social_tool.rb'
  # the two lines above need to be commented out when in production mode and eager loading is active
  require 'date'

  def home
    @posts = Blog.all
    @skills = Skill.all
  end

  def about
    @skills = Skill.all
  end

  def contact
  end

  def tech_news
    @tweets = SocialTool.twitter_search

    
    newsAPI_client = Apis::NewsApi::V2::Client.new(ENV['NEWS_API_KEY'])
    
    search_terms = "JavaScript"
    date = (Date.today).iso8601
    sort_by = "popularity"

    user_search = newsAPI_client.user_search(search_terms, date, sort_by)
  end
  
end
