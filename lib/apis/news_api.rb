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
          from_date = (start_date-7).iso8601
          to_date = start_date.iso8601

          url = "q=#{search_terms}&from=#{from_date}&to=#{to_date}&sortBy=#{sort_by}&language=en&page=2"
      
          response = Faraday.get("http://newsapi.org/v2/everything?#{url}") do |req|
            req.headers["x-api-key"] = @api_key
          end
          
          parsed_response = JSON.parse(response.body)
          parsed_results = parsed_response['articles']
          response_code = response.env.status
          
          return parsed_results if response_successful?(response_code)
          begin
            error_message = "Code: #{response_code}, Response: #{parsed_response['message']}"
            raise StandardError.new "#{error_message}"
          rescue
            redirect_to blogs_path, flash: { error: error_message }
          end
        end

        def response_successful?(response_code)
          response_code == 200
        end
      end
    end
  end
end