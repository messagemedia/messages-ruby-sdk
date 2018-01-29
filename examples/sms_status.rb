require 'message_media_messages'

# Configuration parameters and credentials
basic_auth_user_name = 'YOUR_API_KEY' # The username to use with basic authentication
basic_auth_password = 'YOUR_API_SECRET' # The password to use with basic authentication

client = MessageMediaMessages::MessageMediaMessagesClient.new(
  basic_auth_user_name: basic_auth_user_name,
  basic_auth_password: basic_auth_password
)

messages = client.messages
message_id = 'YOUR_MESSAGE_ID'

result = messages.get_message_status(message_id)
print result
