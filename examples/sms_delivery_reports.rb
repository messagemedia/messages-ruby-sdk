require 'message_media_messages'

# Configuration parameters and credentials
auth_user_name = 'API_KEY' # The username to use with basic/HMAC authentication
auth_password = 'API_SECRET' # The password to use with basic/HMAC authentication
use_hmac = false # Change this to true if you are using HMAC keys

client = MessageMediaMessages::MessageMediaMessagesClient.new(
    auth_user_name: auth_user_name,
    auth_password: auth_password,
    use_hmac: use_hmac
)

deliveryReports = client.delivery_reports

result = deliveryReports.get_check_delivery_reports()
print result.inspect
