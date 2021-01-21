module Apis
  module NewsApi
    module V2
      class Client
        require './lib/apis/http_status_codes.rb'
        require './lib/apis/api_exceptions.rb'
# the two lines above need to be commented out when in production mode and eager loading is active

        require 'date'
        require 'faraday'

        include HttpStatusCodes
        include ApiExceptions

        attr_reader :api_key

        def initialize(api_key)
          @api_key = api_key
        end

        def user_search(search_terms, start_date, sort_by)
      
          url = "q=#{search_terms}&from=#{start_date}&sortBy=#{sort_by}&language=en&page=2"
      
          response = Faraday.get("http://newsapi.org/v2/everything?#{url}") do |req|
            req.headers["x-api-key"] = @api_key
          end
          
          response_status = response.env.status
          parsed_response = JSON.parse(response.body)

          return parsed_response if response_successful?(response_status)
          raise error_class(response_status), "Code: #{response_status}, response: #{response.body}"
        end

        def error_class(response)
          case response
          when HTTP_BAD_REQUEST_CODE
            BadRequestError
          when HTTP_UNAUTHORIZED_CODE
            UnauthorizedError
          when HTTP_FORBIDDEN_CODE
            return ApiRequestsQuotaReachedError if api_requests_quota_reached?
            ForbiddenError
          when HTTP_NOT_FOUND_CODE
            NotFoundError
          when HTTP_UNPROCESSABLE_ENTITY_CODE
            UnprocessableEntityError
          else
            ApiError
          end
        end

        def response_successful?(response)
          response == HTTP_OK_CODE
        end

        def api_requests_quota_reached?
          response.body.match?('API rate limit exceeded')
        end
      end
    end
  end
end