# MessageMedia Messages Ruby SDK
[![Travis Build Status](https://api.travis-ci.org/messagemedia/messages-ruby-sdk.svg?branch=master)](https://travis-ci.org/messagemedia/messages-ruby-sdk)

The MessageMedia Messages API provides a number of endpoints for building powerful two-way messaging applications.

## Authentication

Authentication is done via API keys. Sign up at https://developers.messagemedia.com/register/ to get your API keys.

Requests are authenticated using HTTP Basic Auth. Provide your API keys as the basic auth username and basic auth password.

## Errors

Our API returns standard HTTP success or error status codes. For errors, we will also include extra information about what went wrong encoded in the response as JSON. The most common status codes are listed below. To view the full list, visit https://github.com/messagemedia/messages-ruby-sdk/wiki/HTTP-Status-Codes

#### HTTP Status Codes

| Code      | Title       | Description |
|-----------|-------------|-------------|
| 202 | OK | The request was successful |
| 400 | Bad Request | Bad request |
| 401 | Unauthorized | Your API key is invalid |
| 402 | Disabled feature | Feature cannot be accessed |
| 404 | Not Found |	The resource does not exist |
| 50X | Internal Server Error | An error occurred with our API |


## Information

#### :mailbox_with_mail: Slack and Mailing List

If you have any questions, comments, or concerns, please join our Slack channel:
https://developers.messagemedia.com/collaborate/slack/

Alternatively you can email us at:
developers@messagemedia.com

#### :bug: Bug reports

If you discover a problem with the SDK, we would like to know about it. Send an email to:
developers@messagemedia.com

#### :chart_with_upwards_trend: Rate Limits

To protect the stability of the API and keep it available to all users, MessageMedia enforces standard rate limiting. Currently, we have set the quota to 100 SMS per account. We may change these quotas or add new quotas (such as maximum requests per hour) in the future. Requests that hit any of our rate limits will receive a 402 response and you will be notified via email that your quota has been exceeded. If you think you’ll need a higher rate limit, drop us a line at support@messagemedia.com.au


## Getting Started

This documentation will guide on how to get up and running with the SDK on:
* Vanilla Ruby
* [Ruby on Rails](##Ruby-on-Rails)

## Vanilla Ruby

### 1. Pre-requisites
* [Ruby](https://www.ruby-lang.org/en/downloads/)
* Text Editor (We've provided a list of suggestions)
  * [Atom](https://atom.io/)
  * [Notepad++](https://notepad-plus-plus.org/)
  * [Visual Studio Code](https://code.visualstudio.com/)

### 2. Downloading the SDK
The SDK can be downloaded directly from Github. On the right side of the main page of the master branch, click on the green button that says "Clone or download" and then click on "Download ZIP". Extract this folder to your desktop. Now create a folder on your desktop called "mm_ruby". We will use this in the next step.

![picture](http://i68.tinypic.com/2lvij5s.jpg)

### 3. Getting the neccessary components ready
Inside the extracted folder (messages-ruby-sdk-master), you will find a lot of files that you can explore if you're interested in the structure of the SDK. For now we're going to focus on two certain components. Click on the "lib" folder and inside you will find a file and a folder called "message_media_messages". Copy-paste both of these into the "mm_ruby" folder created earlier. We're halfway through!

![picture](http://i64.tinypic.com/32zq71z.jpg)

### 4. Creating the main file
Open your text editor and copy-paste this chunk of code into it:

```
$LOAD_PATH.unshift('.')
require 'message_media_messages.rb'

basic_auth_user_name = 'YOUR_API_KEY'
basic_auth_password = 'YOUR_API_SECRET'

client = MessageMediaMessages::MessageMediaMessagesClient.new(
  basic_auth_user_name: basic_auth_user_name,
  basic_auth_password: basic_auth_password
)

messages = client.messages
body_value = '{
   "messages":[
      {
         "content":"Greeting from MessageMedia!",
         "destination_number":"MOBILE_NUMBER"
      }
   ]
}';

body = JSON.parse(body_value);

result = messages.create_send_messages(body)
```

#### Make sure you update the credentials and the destination number.
Now save it as a ruby file (.rb) inside the "mm_ruby" folder and name the file "messagemedia".
In case you haven't figured it out yet, this is a "starter pack" code for sending a message to a mobile number.
You can add lots of other properties to the body. To find out more visit https://developers.messagemedia.com/code/messages-api-documentation/

### 5. Running the application
* Open your command prompt
* ``` cd ``` into the "mm_ruby" folder
* Run the command ``` ruby messagemedia.rb ```
* Voila!


## Ruby on Rails

### 1. Pre-requisites
* [Ruby](https://www.ruby-lang.org/en/downloads/)
* IDE (We will be using [RubyMine](https://www.jetbrains.com/ruby) for this guide)

### 2. Downloading the SDK
The SDK can be downloaded directly from Github. On the right side of the main page of the master branch, click on the green button that says "Clone or download" and then click on "Download ZIP". Extract this folder to your desktop.

![picture](http://i68.tinypic.com/2lvij5s.jpg)

### 3. Creating a new Rails project

* Open RubyMine
* Click on File -> New project
* On the mini-screen, under Rails, click Application
* The ruby interpreter should be automatically detected in the Ruby SDK option
* Rename your project from "untitled" to "messagemedia_messages"
* Click create

![picture](http://i64.tinypic.com/2gumhyp.png)

You will see the following displayed in the terminal after a successful installation

![picture](http://i67.tinypic.com/2e208li.png)

### 4. Referencing the MessageMedia gem

* Open the Gemfile
* Add the following line ``` gem 'messagemedia_messages_sdk', '~> 1.0' ```
* Save the file
* Click on View -> Tool Windows -> Terminal
* Run the following command ``` bundle install ``` to install the SDK

![picture](http://i66.tinypic.com/t8ubrs.png)

### 5. Adding additional dependency files

* Open the lib folder and create a new directory/folder called "mm"
* Now open the SDK folder (messages-ruby-sdk) you downloaded earlier in Step 2
* Click on lib and copy-paste the file and folder (message_media_messages) to the "mm" folder in your Rails application

![picture](http://i68.tinypic.com/f20epu.jpg)
* Click on config -> application.rb
* Under ``` config.load_defaults ``` add the following line ``` config.autoload_paths << Rails.root.join('lib/mm') ```

![picture](http://i68.tinypic.com/16hj42c.jpg)
In case you were wondering, this line basically loads the dependency files for our Rails application

### 6. Adding a controller

* In the terminal, run the following command ``` rails g controller Home index ```
* This will create a controller with the name "Home" with an action/method called "index"
* Open the generated controller which can be found under app -> controller -> home_controller.rb
* Inside the index action, paste this chunk of code:

```
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

#### Make sure you update the credentials and the destination number.

### 7. Running the application

* Click on Run -> Run -> Development: messagemedia_messages
* You will see the following displayed in the console after the application starts running

![picture](http://i68.tinypic.com/213qeqv.jpg)
* Once you see that, open your browser and type in http://localhost:3000/ and press Enter
* You should see a heading that says "Home#index" and within a few seconds your message should be delivered to the destination number

## Supported Ruby Versions

This library supports and is [tested against](https://travis-ci.org/messagemedia/messages-ruby-sdk) the following Ruby implementations:

* Ruby 2.4.0
* Ruby 2.3.0
* Ruby 2.2.0
* Ruby 2.1.0
* Ruby 2.0.0


# Class Reference

## <a name="list_of_controllers"></a>List of Controllers

* [MessagesController](#messages_controller)
* [DeliveryReportsController](#delivery_reports_controller)
* [RepliesController](#replies_controller)

## <a name="messages_controller"></a>![Class: ](https://apidocs.io/img/class.png ".MessagesController") MessagesController

### Get singleton instance

The singleton instance of the ``` MessagesController ``` class can be accessed from the API Client.

```ruby
messages = client.messages
```

### <a name="update_cancel_scheduled_message"></a>![Method: ](https://apidocs.io/img/method.png ".MessagesController.update_cancel_scheduled_message") update_cancel_scheduled_message

> Cancel a scheduled message that has not yet been delivered.
> A scheduled message can be cancelled by updating the status of a message from ```scheduled```
> to ```cancelled```. This is done by submitting a PUT request to the messages endpoint using
> the message ID as a parameter (the same endpoint used above to retrieve the status of a message).
> The body of the request simply needs to contain a ```status``` property with the value set
> to ```cancelled```.
> ```json
> {
>     "status": "cancelled"
> }
> ```
> *Note: Only messages with a status of scheduled can be cancelled. If an invalid or non existent
> message ID parameter is specified in the request, then a HTTP 404 Not Found response will be
> returned*


```ruby
def update_cancel_scheduled_message(message_id,
                                        body); end
```

#### Parameters

| Parameter | Tags | Description |
|-----------|------|-------------|
| message_id |  ``` Required ```  | The ID of the message |
| body |  ``` Required ```  | The content of the message |


#### Example Usage

```ruby
message_id = 'messageId'
body = CancelScheduledMessageRequest.new

result = messages.update_cancel_scheduled_message(message_id, body)

```


### <a name="get_message_status"></a>![Method: ](https://apidocs.io/img/method.png ".MessagesController.get_message_status") get_message_status

> Retrieve the current status of a message using the message ID returned in the send messages end point.
> A successful request to the get message status endpoint will return a response body as follows:
> ```json
> {
>     "format": "SMS",
>     "content": "My first message!",
>     "metadata": {
>         "key1": "value1",
>         "key2": "value2"
>     },
>     "message_id": "877c19ef-fa2e-4cec-827a-e1df9b5509f7",
>     "callback_url": "https://my.callback.url.com",
>     "delivery_report": true,
>     "destination_number": "+61401760575",
>     "scheduled": "2016-11-03T11:49:02.807Z",
>     "source_number": "+61491570157",
>     "source_number_type": "INTERNATIONAL"
>     "message_expiry_timestamp": "2016-11-03T11:49:02.807Z",
>     "status": "enroute"
> }
> ```
> The status property of the response indicates the current status of the message. See the Delivery
> Reports section of this documentation for more information on message statues.
> *Note: If an invalid or non existent message ID parameter is specified in the request, then
> a HTTP 404 Not Found response will be returned*


```ruby
def get_message_status(message_id); end
```

#### Parameters

| Parameter | Tags | Description |
|-----------|------|-------------|
| message_id |  ``` Required ```  | The ID of the message |


#### Example Usage

```ruby
message_id = 'messageId'

result = messages.get_message_status(message_id)

```


### <a name="create_send_messages"></a>![Method: ](https://apidocs.io/img/method.png ".MessagesController.create_send_messages") create_send_messages

> Submit one or more (up to 100 per request) SMS or text to voice messages for delivery.
> The most basic message has the following structure:
> ```json
> {
>     "messages": [
>         {
>             "content": "My first message!",
>             "destination_number": "+61491570156"
>         }
>     ]
> }
> ```
> More advanced delivery features can be specified by setting the following properties in a message:
> - ```callback_url``` A URL can be included with each message to which Webhooks will be pushed to
>   via a HTTP POST request. Webhooks will be sent if and when the status of the message changes as
>   it is processed (if the delivery report property of the request is set to ```true```) and when replies
>   are received. Specifying a callback URL is optional.
> - ```content``` The content of the message. This can be a Unicode string, up to 5,000 characters long.
>   Message content is required.
> - ```delivery_report``` Delivery reports can be requested with each message. If delivery reports are requested, a webhook
>   will be submitted to the ```callback_url``` property specified for the message (or to the webhooks)
>   specified for the account every time the status of the message changes as it is processed. The
>   current status of the message can also be retrieved via the Delivery Reports endpoint of the
>   Messages API. Delivery reports are optional and by default will not be requested.
> - ```destination_number``` The destination number the message should be delivered to. This should be specified in E.164
>   international format. For information on E.164, please refer to http://en.wikipedia.org/wiki/E.164.
>   A destination number is required.
> - ```format``` The format specifies which format the message will be sent as, ```SMS``` (text message)
>   or ```TTS``` (text to speech). With ```TTS``` format, we will call the destination number and read out the
>   message using a computer generated voice. Specifying a format is optional, by default ```SMS``` will be used.
> - ```source_number``` A source number may be specified for the message, this will be the number that
>   the message appears from on the handset. By default this feature is _not_ available and will be ignored
>   in the request. Please contact <support@messagemeda.com> for more information. Specifying a source
>   number is optional and a by default a source number will be assigned to the message.
> - ```source_number_type``` If a source number is specified, the type of source number may also be
>   specified. This is recommended when using a source address type that is not an internationally
>   formatted number, available options are ```INTERNATIONAL```, ```ALPHANUMERIC``` or ```SHORTCODE```. Specifying a
>   source number type is only valid when the ```source_number``` parameter is specified and is optional.
>   If a source number is specified and no source number type is specified, the source number type will be
>   inferred from the source number, however this may be inaccurate.
> - ```scheduled``` A message can be scheduled for delivery in the future by setting the scheduled property.
>   The scheduled property expects a date time specified in ISO 8601 format. The scheduled time must be
>   provided in UTC and is optional. If no scheduled property is set, the message will be delivered immediately.
> - ```message_expiry_timestamp``` A message expiry timestamp can be provided to specify the latest time
>   at which the message should be delivered. If the message cannot be delivered before the specified
>   message expiry timestamp elapses, the message will be discarded. Specifying a message expiry
>   timestamp is optional.
> - ```metadata``` Metadata can be included with the message which will then be included with any delivery
>   reports or replies matched to the message. This can be used to create powerful two-way messaging
>   applications without having to store persistent data in the application. Up to 10 key / value metadata data
>   pairs can be specified in a message. Each key can be up to 100 characters long, and each value up to
>   256 characters long. Specifying metadata for a message is optional.
> The response body of a successful POST request to the messages endpoint will include a ```messages```
> property which contains a list of all messages submitted. The list of messages submitted will
> reflect the list of messages included in the request, but each message will also contain two new
> properties, ```message_id``` and ```status```. The returned message ID will be a 36 character UUID
> which can be used to check the status of the message via the Get Message Status endpoint. The status
> of the message which reflect the status of the message at submission time which will always be
> ```queued```. See the Delivery Reports section of this documentation for more information on message
> statues.
> *Note: when sending multiple messages in a request, all messages must be valid for the request to be successful.
> If any messages in the request are invalid, no messages will be sent.*


```ruby
def create_send_messages(body); end
```

#### Parameters

| Parameter | Tags | Description |
|-----------|------|-------------|
| body |  ``` Required ```  | The content of the message |


#### Example Usage

```ruby
body_value = "{    \"messages\": [        {            \"callback_url\": \"https://my.callback.url.com\",            \"content\": \"My first message\",            \"destination_number\": \"+61491570156\",            \"delivery_report\": true,            \"format\": \"SMS\",            \"message_expiry_timestamp\": \"2016-11-03T11:49:02.807Z\",            \"metadata\": {                \"key1\": \"value1\",                \"key2\": \"value2\"            },            \"scheduled\": \"2016-11-03T11:49:02.807Z\",            \"source_number\": \"+61491570157\",            \"source_number_type\": \"INTERNATIONAL\"        },        {            \"callback_url\": \"https://my.callback.url.com\",            \"content\": \"My second message\",            \"destination_number\": \"+61491570158\",            \"delivery_report\": true,            \"format\": \"SMS\",            \"message_expiry_timestamp\": \"2016-11-03T11:49:02.807Z\",            \"metadata\": {                \"key1\": \"value1\",                \"key2\": \"value2\"            },            \"scheduled\": \"2016-11-03T11:49:02.807Z\",            \"source_number\": \"+61491570159\",            \"source_number_type\": \"INTERNATIONAL\"        }    ]}";
body = JSON.parse(body_value);

result = messages.create_send_messages(body)

```


[Back to List of Controllers](#list_of_controllers)

## <a name="delivery_reports_controller"></a>![Class: ](https://apidocs.io/img/class.png ".DeliveryReportsController") DeliveryReportsController

### Get singleton instance

The singleton instance of the ``` DeliveryReportsController ``` class can be accessed from the API Client.

```ruby
deliveryReports = client.delivery_reports
```

### <a name="get_check_delivery_reports"></a>![Method: ](https://apidocs.io/img/method.png ".DeliveryReportsController.get_check_delivery_reports") get_check_delivery_reports

> Check for any delivery reports that have been received.
> Delivery reports are a notification of the change in status of a message as it is being processed.
> Each request to the check delivery reports endpoint will return any delivery reports received that
> have not yet been confirmed using the confirm delivery reports endpoint. A response from the check
> delivery reports endpoint will have the following structure:
> ```json
> {
>     "delivery_reports": [
>         {
>             "callback_url": "https://my.callback.url.com",
>             "delivery_report_id": "01e1fa0a-6e27-4945-9cdb-18644b4de043",
>             "source_number": "+61491570157",
>             "date_received": "2017-05-20T06:30:37.642Z",
>             "status": "enroute",
>             "delay": 0,
>             "submitted_date": "2017-05-20T06:30:37.639Z",
>             "original_text": "My first message!",
>             "message_id": "d781dcab-d9d8-4fb2-9e03-872f07ae94ba",
>             "vendor_account_id": {
>                 "vendor_id": "MessageMedia",
>                 "account_id": "MyAccount"
>             },
>             "metadata": {
>                 "key1": "value1",
>                 "key2": "value2"
>             }
>         },
>         {
>             "callback_url": "https://my.callback.url.com",
>             "delivery_report_id": "0edf9022-7ccc-43e6-acab-480e93e98c1b",
>             "source_number": "+61491570158",
>             "date_received": "2017-05-21T01:46:42.579Z",
>             "status": "enroute",
>             "delay": 0,
>             "submitted_date": "2017-05-21T01:46:42.574Z",
>             "original_text": "My second message!",
>             "message_id": "fbb3b3f5-b702-4d8b-ab44-65b2ee39a281",
>             "vendor_account_id": {
>                 "vendor_id": "MessageMedia",
>                 "account_id": "MyAccount"
>             },
>             "metadata": {
>                 "key1": "value1",
>                 "key2": "value2"
>             }
>         }
>     ]
> }
> ```
> Each delivery report will contain details about the message, including any metadata specified
> and the new status of the message (as each delivery report indicates a change in status of a
> message) and the timestamp at which the status changed. Every delivery report will have a
> unique delivery report ID for use with the confirm delivery reports endpoint.
> *Note: The source number and destination number properties in a delivery report are the inverse of
> those specified in the message that the delivery report relates to. The source number of the
> delivery report is the destination number of the original message.*
> Subsequent requests to the check delivery reports endpoint will return the same delivery reports
> and a maximum of 100 delivery reports will be returned in each request. Applications should use the
> confirm delivery reports endpoint in the following pattern so that delivery reports that have been
> processed are no longer returned in subsequent check delivery reports requests.
> 1. Call check delivery reports endpoint
> 2. Process each delivery report
> 3. Confirm all processed delivery reports using the confirm delivery reports endpoint
> *Note: It is recommended to use the Webhooks feature to receive reply messages rather than
> polling the check delivery reports endpoint.*


```ruby
def get_check_delivery_reports; end
```

#### Example Usage

```ruby

result = deliveryReports.get_check_delivery_reports()

```


### <a name="create_confirm_delivery_reports_as_received"></a>![Method: ](https://apidocs.io/img/method.png ".DeliveryReportsController.create_confirm_delivery_reports_as_received") create_confirm_delivery_reports_as_received

> Mark a delivery report as confirmed so it is no longer return in check delivery reports requests.
> The confirm delivery reports endpoint is intended to be used in conjunction with the check delivery
> reports endpoint to allow for robust processing of delivery reports. Once one or more delivery
> reports have been processed, they can then be confirmed using the confirm delivery reports endpoint so they
> are no longer returned in subsequent check delivery reports requests.
> The confirm delivery reports endpoint takes a list of delivery report IDs as follows:
> ```json
> {
>     "delivery_report_ids": [
>         "011dcead-6988-4ad6-a1c7-6b6c68ea628d",
>         "3487b3fa-6586-4979-a233-2d1b095c7718",
>         "ba28e94b-c83d-4759-98e7-ff9c7edb87a1"
>     ]
> }
> ```
> Up to 100 delivery reports can be confirmed in a single confirm delivery reports request.


```ruby
def create_confirm_delivery_reports_as_received(body); end
```

#### Parameters

| Parameter | Tags | Description |
|-----------|------|-------------|
| body |  ``` Required ```  | The content of the message |


#### Example Usage

```ruby
body_value = "{    \"delivery_report_ids\": [        \"011dcead-6988-4ad6-a1c7-6b6c68ea628d\",        \"3487b3fa-6586-4979-a233-2d1b095c7718\",        \"ba28e94b-c83d-4759-98e7-ff9c7edb87a1\"    ]}";
body = JSON.parse(body_value);

result = deliveryReports.create_confirm_delivery_reports_as_received(body)

```


[Back to List of Controllers](#list_of_controllers)

## <a name="replies_controller"></a>![Class: ](https://apidocs.io/img/class.png ".RepliesController") RepliesController

### Get singleton instance

The singleton instance of the ``` RepliesController ``` class can be accessed from the API Client.

```ruby
replies = client.replies
```

### <a name="create_confirm_replies_as_received"></a>![Method: ](https://apidocs.io/img/method.png ".RepliesController.create_confirm_replies_as_received") create_confirm_replies_as_received

> Mark a reply message as confirmed so it is no longer returned in check replies requests.
> The confirm replies endpoint is intended to be used in conjunction with the check replies endpoint
> to allow for robust processing of reply messages. Once one or more reply messages have been processed
> they can then be confirmed using the confirm replies endpoint so they are no longer returned in
> subsequent check replies requests.
> The confirm replies endpoint takes a list of reply IDs as follows:
> ```json
> {
>     "reply_ids": [
>         "011dcead-6988-4ad6-a1c7-6b6c68ea628d",
>         "3487b3fa-6586-4979-a233-2d1b095c7718",
>         "ba28e94b-c83d-4759-98e7-ff9c7edb87a1"
>     ]
> }
> ```
> Up to 100 replies can be confirmed in a single confirm replies request.


```ruby
def create_confirm_replies_as_received(body); end
```

#### Parameters

| Parameter | Tags | Description |
|-----------|------|-------------|
| body |  ``` Required ```  | The content of the message |


#### Example Usage

```ruby
body_value = "{    \"reply_ids\": [        \"011dcead-6988-4ad6-a1c7-6b6c68ea628d\",        \"3487b3fa-6586-4979-a233-2d1b095c7718\",        \"ba28e94b-c83d-4759-98e7-ff9c7edb87a1\"    ]}";
body = JSON.parse(body_value);

result = replies.create_confirm_replies_as_received(body)

```


### <a name="get_check_replies"></a>![Method: ](https://apidocs.io/img/method.png ".RepliesController.get_check_replies") get_check_replies

> Check for any replies that have been received.
> Replies are messages that have been sent from a handset in response to a message sent by an
> application or messages that have been sent from a handset to a inbound number associated with
> an account, known as a dedicated inbound number (contact <support@messagemedia.com> for more
> information on dedicated inbound numbers).
> Each request to the check replies endpoint will return any replies received that have not yet
> been confirmed using the confirm replies endpoint. A response from the check replies endpoint
> will have the following structure:
> ```json
> {
>     "replies": [
>         {
>             "metadata": {
>                 "key1": "value1",
>                 "key2": "value2"
>             },
>             "message_id": "877c19ef-fa2e-4cec-827a-e1df9b5509f7",
>             "reply_id": "a175e797-2b54-468b-9850-41a3eab32f74",
>             "date_received": "2016-12-07T08:43:00.850Z",
>             "callback_url": "https://my.callback.url.com",
>             "destination_number": "+61491570156",
>             "source_number": "+61491570157",
>             "vendor_account_id": {
>                 "vendor_id": "MessageMedia",
>                 "account_id": "MyAccount"
>             },
>             "content": "My first reply!"
>         },
>         {
>             "metadata": {
>                 "key1": "value1",
>                 "key2": "value2"
>             },
>             "message_id": "8f2f5927-2e16-4f1c-bd43-47dbe2a77ae4",
>             "reply_id": "3d8d53d8-01d3-45dd-8cfa-4dfc81600f7f",
>             "date_received": "2016-12-07T08:43:00.850Z",
>             "callback_url": "https://my.callback.url.com",
>             "destination_number": "+61491570157",
>             "source_number": "+61491570158",
>             "vendor_account_id": {
>                 "vendor_id": "MessageMedia",
>                 "account_id": "MyAccount"
>             },
>             "content": "My second reply!"
>         }
>     ]
> }
> ```
> Each reply will contain details about the reply message, as well as details of the message the reply was sent
> in response to, including any metadata specified. Every reply will have a reply ID to be used with the
> confirm replies endpoint.
> *Note: The source number and destination number properties in a reply are the inverse of those
> specified in the message the reply is in response to. The source number of the reply message is the
> same as the destination number of the original message, and the destination number of the reply
> message is the same as the source number of the original message. If a source number
> wasn't specified in the original message, then the destination number property will not be present
> in the reply message.*
> Subsequent requests to the check replies endpoint will return the same reply messages and a maximum
> of 100 replies will be returned in each request. Applications should use the confirm replies endpoint
> in the following pattern so that replies that have been processed are no longer returned in
> subsequent check replies requests.
> 1. Call check replies endpoint
> 2. Process each reply message
> 3. Confirm all processed reply messages using the confirm replies endpoint
> *Note: It is recommended to use the Webhooks feature to receive reply messages rather than polling
> the check replies endpoint.*


```ruby
def get_check_replies; end
```

#### Example Usage

```ruby

result = replies.get_check_replies()

```


[Back to List of Controllers](#list_of_controllers)
