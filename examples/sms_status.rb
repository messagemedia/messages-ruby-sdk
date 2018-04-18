require 'message_media_messages'

# Configuration parameters and credentials
auth_user_name = 'API_SECRET' # The username to use with basic/HMAC authentication
auth_password = 'API_KEY' # The password to use with basic/HMAC authentication
use_hmac = false # Change this to true if you are using HMAC keys

client = MessageMediaMessages::MessageMediaMessagesClient.new(
    auth_user_name: auth_user_name,
    auth_password: auth_password,
    use_hmac: use_hmac
)

messages = client.messages
message_id = 'YOUR_MESSAGE_ID'

result = messages.get_message_status(message_id)
print result.inspect
