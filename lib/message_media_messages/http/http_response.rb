# This file was automatically generated for MessageMedia by APIMATIC v2.0
# ( https://apimatic.io ).

module MessageMediaMessages
  # Http response received.
  class HttpResponse
    attr_accessor :status_code, :headers, :raw_body

    # The constructor
    # @param [Integer] status_code The status code returned by the server.
    # @param [Hash] headers The headers sent by the server in the response.
    # @param [String] raw_body The raw body of the response.
    def initialize(status_code,
                   headers,
                   raw_body)
      @status_code = status_code
      @headers = headers
      @raw_body = raw_body
    end
  end
end
