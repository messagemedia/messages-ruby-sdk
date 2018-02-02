# This file was automatically generated for MessageMedia by APIMATIC v2.0 ( https://apimatic.io ).

class HttpResponseCatcher < MessageMediaMessages::HttpCallBack
  attr_accessor :response

  def on_before_request(request)
  end

  # Catching the response
  def on_after_response(context)
    @response = context.response
  end
end



