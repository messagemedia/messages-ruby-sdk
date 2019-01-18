require 'message_media_messages'
require 'pp'

auth_user_name = 'API_KEY'
auth_password = 'API_SECRET'
use_hmac = false

client = MessageMediaMessages::MessageMediaMessagesClient.new(
    auth_user_name: auth_user_name,
    auth_password: auth_password,
    use_hmac_authentication: use_hmac
)

delivery_reports_controller = client.delivery_reports
begin
  result = delivery_reports_controller.check_delivery_reports()
  pp result
rescue APIException => ex
  puts "Caught APIException: #{ex.message}"
end
