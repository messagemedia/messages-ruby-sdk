# This file was automatically generated for MessageMedia by APIMATIC v2.0
# ( https://apimatic.io ).

require 'message_media_messages/configuration.rb'

module MessageMediaMessages
  # Base controller.
  class BaseController
    attr_accessor :http_client, :http_call_back

    def initialize(http_client: nil, http_call_back: nil)
      @http_client = http_client || FaradayClient.new
      @http_call_back = http_call_back

      @global_headers = {
        'user-agent' => 'messagemedia-messages-ruby-sdk-1.0.0'
      }

      @logger = Logging.logger[self]
      @logger.info("Instantiated controller class.")
    end

    def validate_parameters(args)
      args.each do |_name, value|
        if value.nil?
          raise ArgumentError, "Required parameter #{_name} cannot be nil."
        end
      end
    end

    def apply_authentication(request, url, body=nil)
      if Configuration.hmac_auth_user_name == nil or Configuration.hmac_auth_password == nil
        BasicAuth.apply(request)
      else
        HmacAuth.apply(request, url, body)
      end
    end

    def execute_request(request, binary: false, name: nil)
      @logger.info("Calling the on_before_request method of http_call_back for #{name}.") if @http_call_back
      @http_call_back.on_before_request(request) if @http_call_back

      @logger.info("Merging global headers with endpoint headers for #{name}.")
      APIHelper.clean_hash(request.headers)
      request.headers = @global_headers.clone.merge(request.headers)

      @logger.debug("Raw request for #{name} is: #{request.inspect}")
      response = if binary
                   @http_client.execute_as_binary(request)
                 else
                   @http_client.execute_as_string(request)
                 end
      @logger.debug("Raw response for #{name} is: #{response.inspect}")
      @logger.info("Wrapping request and response in a context object for #{name}.")
      context = HttpContext.new(request, response)

      @logger.info("Calling on_after_response method of http_call_back for #{name}.") if @http_call_back
      @http_call_back.on_after_response(context) if @http_call_back

      context
    end

    def add_account_header(headers, account_header_value)
      if headers != nil && account_header_value != nil
        headers["account"] = account_header_value
      end
    end

    def validate_response(context)
      raise APIException.new 'HTTP Response Not OK. ' + context.response.raw_body, context unless
        context.response.status_code.between?(200, 208) # [200,208] = HTTP OK
    end
  end
end
