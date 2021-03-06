module SocialTool

  attr_reader :search_terms
  
  def self.twitter_search(search_terms)
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV.fetch("TWITTER_API_KEY")
      config.consumer_secret     = ENV.fetch("TWITTER_API_KEY_SECRET")
      config.access_token        = ENV.fetch("TWITTER_ACCESS_TOKEN")
      config.access_token_secret = ENV.fetch("TWITTER_ACCESS_SECRET")
    end

    client.search("##{search_terms} -rt", lang: "en", tweet_mode: "extended", result_type: "recent").take(35).collect do |tweet|
      "#{tweet.user.screen_name}: #{tweet.full_text}"
    end
  end
end