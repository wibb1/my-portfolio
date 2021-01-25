module Apis
  class NewsData
    include ActiveModel::Model
    
    attr_accessor :source, :author, :title, :blurb, :url, :image, :date, :body

    def initialize(source, author, title, blurb, url, image, date, body)
      @source = source
      @author = author
      @title = title
      @blurb = blurb
      @url = url
      @image = image
      @date = date
      @body = body
    end
  end
end