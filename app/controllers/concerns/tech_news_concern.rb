module TechNewsConcern
  extend ActiveSupport::Concern

  def tech_news_articles(api_response)
    api_response.map do |article|
    
    Apis::NewsData.new(
      article['source']['name'],
      article['author'],
      article['title'],
      article['description'],
      article['url'],
      article['urlToImage'],
      article['publishedAt'],
      article['content']
      )
    end
  end
end