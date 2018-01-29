require 'message_media_messages'

# Configuration parameters and credentials
basic_auth_user_name = 'YOUR_API_KEY' # The username to use with basic authentication
basic_auth_password = 'YOUR_API_SECRET' # The password to use with basic authentication

client = MessageMediaMessages::MessageMediaMessagesClient.new(
  basic_auth_user_name: basic_auth_user_name,
  basic_auth_password: basic_auth_password
)

deliveryReports = client.delivery_reports

result = deliveryReports.get_check_delivery_reports()
