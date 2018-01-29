require 'message_media_messages'

# Configuration parameters and credentials
basic_auth_user_name = 'YOUR_API_KEY' # The username to use with basic authentication
basic_auth_password = 'YOUR_API_SECRET' # The password to use with basic authentication

client = MessageMediaMessages::MessageMediaMessagesClient.new(
  basic_auth_user_name: basic_auth_user_name,
  basic_auth_password: basic_auth_password
)

messages = client.messages
body_value = '{
   "messages":[
      {
         "content":"My first message",
         "destination_number":"YOUR_MOBILE_NUMBER"
      }
   ]
}';

body = JSON.parse(body_value);

result = messages.create_send_messages(body)
