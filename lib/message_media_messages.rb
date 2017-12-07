# This file was automatically generated for MessageMedia by APIMATIC v2.0
# ( https://apimatic.io ).
require 'date'
require 'json'
require 'faraday'
require 'certifi'
require 'logging'

require_relative 'message_media_messages/api_helper.rb'
require_relative 'message_media_messages/message_media_messages_client.rb'

# Http
require_relative 'message_media_messages/http/http_call_back.rb'
require_relative 'message_media_messages/http/http_client.rb'
require_relative 'message_media_messages/http/http_method_enum.rb'
require_relative 'message_media_messages/http/http_request.rb'
require_relative 'message_media_messages/http/http_response.rb'
require_relative 'message_media_messages/http/http_context.rb'
require_relative 'message_media_messages/http/faraday_client.rb'
require_relative 'message_media_messages/http/auth/basic_auth.rb'
require_relative 'message_media_messages/http/auth/hmac_auth.rb'

# Models
require_relative 'message_media_messages/models/base_model.rb'
require_relative 'message_media_messages/models' \
                 '/check_delivery_reports_response.rb'
require_relative 'message_media_messages/models' \
                 '/confirm_replies_as_received_request_8.rb'
require_relative 'message_media_messages/models' \
                 '/confirm_replies_as_received_request.rb'
require_relative 'message_media_messages/models/check_replies_response.rb'
require_relative 'message_media_messages/models' \
                 '/cancel_scheduled_message_request.rb'
require_relative 'message_media_messages/models/send_messages_response.rb'
require_relative 'message_media_messages/models/send_messages_request.rb'
require_relative 'message_media_messages/models' \
                 '/confirm_delivery_reports_as_received_request.rb'
require_relative 'message_media_messages/models' \
                 '/confirm_delivery_reports_as_received_request_11.rb'

# Exceptions
require_relative 'message_media_messages/exceptions/api_exception.rb'

require_relative 'message_media_messages/configuration.rb'

# Controllers
require_relative 'message_media_messages/controllers/base_controller.rb'
require_relative 'message_media_messages/controllers/messages_controller.rb'
require_relative 'message_media_messages/controllers/delivery_reports_controller.rb'
require_relative 'message_media_messages/controllers/replies_controller.rb'
