# This file was automatically generated for MessageMedia by APIMATIC v2.0
# ( https://apimatic.io ).

module MessageMediaMessages
  #  message_media_messages client class.
  class MessageMediaMessagesClient
    # Singleton access to messages controller.
    # @return [MessagesController] Returns the controller instance.
    def messages
      MessagesController.instance
    end

    # Singleton access to delivery_reports controller.
    # @return [DeliveryReportsController] Returns the controller instance.
    def delivery_reports
      DeliveryReportsController.instance
    end

    # Singleton access to replies controller.
    # @return [RepliesController] Returns the controller instance.
    def replies
      RepliesController.instance
    end

    # Returns the configuration class for easy access.
    # @return [Configuration] Returns the actual configuration class.
    def config
      Configuration
    end

    # Initializer with authentication and configuration parameters.
    def initialize(basic_auth_user_name: nil, basic_auth_password: nil)
      Configuration.basic_auth_user_name = basic_auth_user_name if
        basic_auth_user_name
      Configuration.basic_auth_password = basic_auth_password if
        basic_auth_password
    end
  end
end
