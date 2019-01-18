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

replies_controller = client.replies
begin
  result = replies_controller.check_replies()
  pp replies
rescue APIException => ex
  puts "Caught APIException: #{ex.message}"
end
