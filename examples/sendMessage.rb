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
body = SendMessagesRequest.new
body.messages = []

body.messages[0] = Message.new
body.messages[0].callback_url = 'https://my.callback.url.com'
body.messages[0].content = 'My first message'
body.messages[0].destination_number = '+61491570156'
body.messages[0].delivery_report = true
body.messages[0].format = FormatEnum::SMS
body.messages[0].message_expiry_timestamp = DateTime.rfc3339('2016-11-03T11:49:02.807Z')
body.messages[0].metadata = JSON.parse('{"key1":"value1","key2":"value2"}')
body.messages[0].scheduled = DateTime.rfc3339('2016-11-03T11:49:02.807Z')
body.messages[0].source_number = '+61491570157'
body.messages[0].source_number_type = SourceNumberTypeEnum::INTERNATIONAL

begin
  result = messages_controller.send_messages(body)
  pp result
rescue SendMessages400ResponseException => ex
  puts "Caught SendMessages400ResponseException: #{ex.message}"
rescue APIException => ex
  puts "Caught APIException: #{ex.message}"
end
