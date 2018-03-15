# MessageMedia Messages Ruby SDK
[![Travis Build Status](https://api.travis-ci.org/messagemedia/messages-ruby-sdk.svg?branch=master)](https://travis-ci.org/messagemedia/messages-ruby-sdk)
[![gem](https://img.shields.io/badge/rubygems-v1.1.0-red.svg)](https://rubygems.org/gems/messagemedia_messages_sdk)


The MessageMedia Messages API provides a number of endpoints for building powerful two-way messaging applications.

## ⭐️ Install via .gem file
* Download [messagemedia_messages_sdk-1.0.0.gem](https://github.com/messagemedia/messages-ruby-sdk/releases/download/v1.0.0/messagemedia_messages_sdk-1.0.0.gem)
run `gem install messagemedia_messages_sdk-1.0.0.gem`

## 🎬 Get Started
It's easy to get started. Simply enter the API Key and secret you obtained from the [MessageMedia Developers Portal](https://developers.messagemedia.com) into the code snippet below and a mobile number you wish to send to.

### 🚀 Send an SMS
* Destination numbers (`destination_number`) should be in the [E.164](http://en.wikipedia.org/wiki/E.164) format. For example, `+61491570156`.
```ruby
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
```

### 🕓 Get Status of a Message
You can get a messsage ID from a sent message by looking at the `message_id` from the response of the above example.
```ruby
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
```

### 💬 Get replies to a message
You can check for replies that are sent to your messages
```ruby
require 'message_media_messages'

# Configuration parameters and credentials
basic_auth_user_name = 'YOUR_API_KEY' # The username to use with basic authentication
basic_auth_password = 'YOUR_API_SECRET' # The password to use with basic authentication

client = MessageMediaMessages::MessageMediaMessagesClient.new(
  basic_auth_user_name: basic_auth_user_name,
  basic_auth_password: basic_auth_password
)

replies = client.replies

result = replies.get_check_replies()
```

### ✅ Check Delivery Reports
This endpoint allows you to check for delivery reports to inbound and outbound messages.
```ruby
require 'message_media_messages'

# Configuration parameters and credentials
basic_auth_user_name = 'YOUR_API_KEY' # The username to use with basic authentication
basic_auth_password = 'YOUR_API_SECRET' # The password to use with basic authentication

client = MessageMediaMessages::MessageMediaMessagesClient.new(
  basic_auth_user_name: basic_auth_user_name,
  basic_auth_password: basic_auth_password
)

deliveryReports = client.delivery_reports

result = deliveryReports.get_check_delivery_reports()
```

## 📕 Documentation
The Ruby SDK Documentation can be viewed [here](DOCUMENTATION.md)

## 😕 Got Stuck?
Please contact developer support at developers@messagemedia.com or check out the developer portal at [developers.messagemedia.com](https://developers.messagemedia.com/)
