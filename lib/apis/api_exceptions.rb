module ApiExceptions
  NewsAPIError = Class.new(StandardError)
  BadRequestError = Class.new(NewsAPIError)
  UnauthorizedError = Class.new(NewsAPIError)
  ForbiddenError = Class.new(NewsAPIError)
  ApiRequestQuotaReachedError = Class.new(NewsAPIError)
  NotFoundError = Class.new(NewsAPIError)
  UnprocessableEntityError = Class.new(NewsAPIError)
  ApiError = Class.new(NewsAPIError)
end