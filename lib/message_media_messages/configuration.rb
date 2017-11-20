# This file was automatically generated for MessageMedia by APIMATIC v2.0
# ( https://apimatic.io ).

module MessageMediaMessages

  Logging.logger.root.appenders = Logging.appenders.stdout
  Logging.logger.root.level = :info

  # All configuration including auth info and base URI for the API access
  # are configured in this class.
  class Configuration
    # The base Uri for API calls
    @base_uri = 'https://api.messagemedia.com'

    # The username to use with basic authentication
    @basic_auth_user_name = 'TODO: Replace'

    # The password to use with basic authentication
    @basic_auth_password = 'TODO: Replace'

    # The attribute accessors for public properties.
    class << self
      attr_accessor :array_serialization
      attr_accessor :base_uri
      attr_accessor :basic_auth_user_name
      attr_accessor :basic_auth_password
    end
  end
end
