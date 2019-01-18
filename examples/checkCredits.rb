require 'message_media_messages'
require 'pp'

include MessageMediaMessages

auth_user_name = 'API_KEY'
auth_password = 'API_SECRET'
use_hmac = false

client = MessageMediaMessages::MessageMediaMessagesClient.new(
    auth_user_name: auth_user_name,
    auth_password: auth_password,
    use_hmac_authentication: use_hmac
)

messages_controller = client.messages
begin
  result = messages_controller.check_credits_remaining()
  pp result
rescue APIException => ex
  puts "Caught APIException: #{ex.message}"
end
