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

messages = client.messages
body_value = '{
   "messages":[
      {
         "content":"My first message",
         "destination_number":"DESTINATION_NUMBER"
      }
   ]
}';

body = JSON.parse(body_value);

result = messages.create_send_messages(body)
