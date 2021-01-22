module Apis
  module NewsApi
    module V2
      class Client
        require 'date'
        require 'faraday'

        attr_reader :api_key

        def initialize(api_key)
          @api_key = api_key
        end

        def user_search(search_terms, start_date, sort_by)
      
          url = "q=#{search_terms}&from=#{start_date}&sortBy=#{sort_by}&language=en&page=2"
      
          response = Faraday.get("http://newsapi.org/v2/everything?#{url}") do |req|
            req.headers["x-api-key"] = @api_key
          end
          
          parsed_response = JSON.parse(response.body)
          parsed_results = parsed_response['articles']
          
          return parsed_results if response_successful?(response.env.status)
          
          raise StandardError.new "Code: #{response.env.status}, Response: #{parsed_response['message']}"
        end

        def response_successful?(response)
          response == 200
        end

        def api_requests_quota_reached?
          response.body.match?('API rate limit exceeded')
        end
      end
    end
  end
end