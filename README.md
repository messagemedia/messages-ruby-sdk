# MessageMedia Messages Ruby SDK
[![Travis Build Status](https://api.travis-ci.org/messagemedia/messages-ruby-sdk.svg?branch=master)](https://travis-ci.org/messagemedia/messages-ruby-sdk)
[![gem](https://badge.fury.io/rb/messagemedia_messages_sdk.svg)](https://rubygems.org/gems/messagemedia_messages_sdk)

The MessageMedia Messages API provides a number of endpoints for building powerful two-way messaging applications.

## ⭐️ Install via RubyGems
* Run the following command to install the SDK via RubyGems: `gem install messagemedia_messages_sdk`

## 🎬 Get Started
It's easy to get started. Simply enter the API Key and secret you obtained from the [MessageMedia Developers Portal](https://developers.messagemedia.com) into the code snippet below and a mobile number you wish to send to.

### 🚀 Send an SMS
* Destination numbers (`destination_number`) should be in the [E.164](http://en.wikipedia.org/wiki/E.164) format. For example, `+61491570156`.
```ruby
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
         "destination_number":"+61491570156"
      }
   ]
}';

body = JSON.parse(body_value);

result = messages.create_send_messages(body)
print result.inspect
```

### 🕓 Get Status of a Message
You can get a messsage ID from a sent message by looking at the `message_id` from the response of the above example.
```ruby
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
message_id = 'YOUR_MESSAGE_ID'

result = messages.get_message_status(message_id)
print result.inspect
```

### 💬 Get replies to a message
You can check for replies that are sent to your messages
```ruby
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

replies = client.replies

result = replies.get_check_replies()
print result.inspect
```

### ✅ Check Delivery Reports
This endpoint allows you to check for delivery reports to inbound and outbound messages.
```ruby
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
```

## 📕 Documentation
Check out the [full API documentation](DOCUMENTATION.md) for more detailed information.

## 😕 Need help?
Please contact developer support at developers@messagemedia.com or check out the developer portal at [developers.messagemedia.com](https://developers.messagemedia.com/)

## 📃 License
Apache License. See the [LICENSE](LICENSE) file.
