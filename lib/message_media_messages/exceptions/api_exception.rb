# This file was automatically generated for MessageMedia by APIMATIC v2.0
# ( https://apimatic.io ).

module MessageMediaMessages
  # Class for exceptions when there is a network error, status code error, etc.
  class APIException < StandardError
    attr_reader :context, :response_code

    # The constructor.
    # @param [String] reason The reason for raising an exception.
    # @param [HttpContext] context The HttpContext of the API call.
    def initialize(reason, context)
      @context = context
      begin
        json_body = JSON.parse(@context.response.raw_body)
        reason = json_body["message"] + ": " + json_body["details"]
      rescue StandardError => e
      end
      super(reason)
      @response_code = context.response.status_code
    end
  end
end
