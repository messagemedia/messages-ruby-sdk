# MessageMedia Messages Ruby SDK
[![Travis Build Status](https://api.travis-ci.org/messagemedia/messages-ruby-sdk.svg?branch=master)](https://travis-ci.org/messagemedia/messages-ruby-sdk)
[![Pull Requests Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat)](http://makeapullrequest.com)
[![gem](https://badge.fury.io/rb/messagemedia_messages_sdk.svg)](https://rubygems.org/gems/messagemedia_messages_sdk)

The MessageMedia Messages API provides a number of endpoints for building powerful two-way messaging applications.

![Isometric](https://i.imgur.com/jJeHwf5.png)

## Table of Contents
* [Authentication](#closed_lock_with_key-authentication)
* [Errors](#interrobang-errors)
* [Information](#newspaper-information)
  * [Slack and Mailing List](#slack-and-mailing-list)
  * [Bug Reports](#bug-reports)
  * [Contributing](#contributing)
* [Installation](#star-installation)
* [Get Started](#clapper-get-started)
* [API Documentation](#closed_book-api-documentation)
* [Need help?](#confused-need-help)
* [License](#page_with_curl-license)

## :closed_lock_with_key: Authentication

Authentication is done via API keys. Sign up at https://developers.messagemedia.com/register/ to get your API keys.

Requests are authenticated using HTTP Basic Auth or HMAC. Provide your API key as the auth_user_name and API secret as the auth_password.

## :interrobang: Errors

Our API returns standard HTTP success or error status codes. For errors, we will also include extra information about what went wrong encoded in the response as JSON. The most common status codes are listed below.

#### HTTP Status Codes

| Code      | Title       | Description |
|-----------|-------------|-------------|
| 400 | Invalid Request | The request was invalid |
| 401 | Unauthorized | Your API credentials are invalid |
| 403 | Disabled feature | Feature not enabled |
| 404 | Not Found |	The resource does not exist |
| 50X | Internal Server Error | An error occurred with our API |

## :newspaper: Information

#### Slack and Mailing List

If you have any questions, comments, or concerns, please join our Slack channel:
https://developers.messagemedia.com/collaborate/slack/

Alternatively you can email us at:
developers@messagemedia.com

#### Bug reports

If you discover a problem with the SDK, we would like to know about it. You can raise an [issue](https://github.com/messagemedia/signingkeys-nodejs-sdk/issues) or send an email to: developers@messagemedia.com

#### Contributing

We welcome your thoughts on how we could best provide you with SDKs that would simplify how you consume our services in your application. You can fork and create pull requests for any features you would like to see or raise an [issue](https://github.com/messagemedia/signingkeys-nodejs-sdk/issues)

## :star Installation
* Run the following command to install the SDK via RubyGems: 
```
gem install messagemedia_messages_sdk
```

## :clapper: Get Started
It's easy to get started. Simply enter the API Key and secret you obtained from the [MessageMedia Developers Portal](https://developers.messagemedia.com) into the code snippet below and a mobile number you wish to send to.

### Send an SMS
Destination numbers (`destination_number`) should be in the [E.164](http://en.wikipedia.org/wiki/E.164) format. For example, `+61491570156`.
```ruby
require 'message_media_messages'
require 'pp'

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
}'

body = JSON.parse(body_value)

result = messages.create_send_messages(body)
pp result
```

## Send an MMS
Destination numbers (`destination_number`) should be in the [E.164](http://en.wikipedia.org/wiki/E.164) format. For example, `+61491570156`.
```ruby
require 'message_media_messages'
require 'pp'

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
         "destination_number":"+61491570156",
         "format":"MMS",
         "subject": "This is an MMS message",
         "media":["https://upload.wikimedia.org/wikipedia/commons/6/6a/L80385-flash-superhero-logo-1544.png"]
      }
   ]
}';

body = JSON.parse(body_value);

result = messages.create_send_messages(body)
pp result
```

### Get Status of a Message
You can get a messsage ID from a sent message by looking at the `message_id` from the response of the above example.
```ruby
require 'message_media_messages'
require 'pp'

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
pp result
```

### Get replies to a message
You can check for replies that are sent to your messages
```ruby
require 'message_media_messages'
require 'pp'

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
pp result
```

### Check Delivery Reports
This endpoint allows you to check for delivery reports to inbound and outbound messages.
```ruby
require 'message_media_messages'
require 'pp'

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
pp result
```

## :closed_book: API Reference Documentation
Check out the [full API documentation](https://developers.messagemedia.com/code/messages-api-documentation/) for more detailed information.

## :confused: Need help?
Please contact developer support at developers@messagemedia.com or check out the developer portal at [developers.messagemedia.com](https://developers.messagemedia.com/)

## :page_with_curl: License
Apache License. See the [LICENSE](LICENSE) file.
