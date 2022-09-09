# Messages

```ruby
messages_controller = client.messages
```

## Class Name

`MessagesController`

## Methods

* [Get Message Status](../../doc/controllers/messages.md#get-message-status)
* [Update Cancel Scheduled Message](../../doc/controllers/messages.md#update-cancel-scheduled-message)
* [Create Send Messages](../../doc/controllers/messages.md#create-send-messages)


# Get Message Status

Retrieve the current status of a message using the message ID returned in the send messages end point.
A successful request to the get message status endpoint will return a response body as follows:

```json
{
    "format": "SMS",
    "content": "My first message!",
    "metadata": {
        "key1": "value1",
        "key2": "value2"
    },
    "message_id": "877c19ef-fa2e-4cec-827a-e1df9b5509f7",
    "callback_url": "https://my.callback.url.com",
    "delivery_report": true,
    "destination_number": "+61401760575",
    "scheduled": "2016-11-03T11:49:02.807Z",
    "source_number": "+61491570157",
    "source_number_type": "INTERNATIONAL"
    "message_expiry_timestamp": "2016-11-03T11:49:02.807Z",
    "status": "enroute"
}
```

The status property of the response indicates the current status of the message. See the Delivery
Reports section of this documentation for more information on message statues.
*Note: If an invalid or non existent message ID parameter is specified in the request, then
a HTTP 404 Not Found response will be returned*

```ruby
def get_message_status(message_id)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `message_id` | `String` | Template, Required | - |

## Response Type

`Mixed`

## Example Usage

```ruby
message_id = 'messageId2'

result = messages_controller.get_message_status(message_id)
```

## Errors

| HTTP Status Code | Error Description | Exception Class |
|  --- | --- | --- |
| 404 | - | `APIException` |


# Update Cancel Scheduled Message

Cancel a scheduled message that has not yet been delivered.
A scheduled message can be cancelled by updating the status of a message from `scheduled`
to `cancelled`. This is done by submitting a PUT request to the messages endpoint using
the message ID as a parameter (the same endpoint used above to retrieve the status of a message).
The body of the request simply needs to contain a `status` property with the value set
to `cancelled`.

```json
{
    "status": "cancelled"
}
```

*Note: Only messages with a status of scheduled can be cancelled. If an invalid or non existent
message ID parameter is specified in the request, then a HTTP 404 Not Found response will be
returned*

```ruby
def update_cancel_scheduled_message(message_id,
                                    content_type,
                                    body)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `message_id` | `String` | Template, Required | - |
| `content_type` | `String` | Header, Required | - |
| `body` | [`CancelScheduledMessageRequest`](../../doc/models/cancel-scheduled-message-request.md) | Body, Required | - |

## Response Type

`Mixed`

## Example Usage

```ruby
message_id = 'messageId2'
content_type = 'application/json'
body = CancelScheduledMessageRequest.new
body.status = 'status2'

result = messages_controller.update_cancel_scheduled_message(message_id, content_type, body)
```

## Errors

| HTTP Status Code | Error Description | Exception Class |
|  --- | --- | --- |
| 400 | - | `APIException` |
| 404 | - | `APIException` |


# Create Send Messages

Submit one or more (up to 100 per request) SMS or text to voice messages for delivery.

```ruby
def create_send_messages(body)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`SendMessagesRequest`](../../doc/models/send-messages-request.md) | Body, Required | - |

## Server

`Server::`

## Response Type

`Mixed`

## Example Usage

```ruby
body = SendMessagesRequest.new
body.messages = []


body.messages[0] = Message.new
body.messages[0].content = 'Hello world!'
body.messages[0].destination_number = '+61491570156'


result = messages_controller.create_send_messages(body)
```

## Example Response

```
{
  "messages": [
    {
      "message_id": "04fe9a97-a579-43c5-bb1a-58ed29bf0a6a",
      "callback_url": "https://my.url.com",
      "status": "delivered",
      "content": "My first message",
      "destination_number": "+61491570156",
      "delivery_report": true,
      "format": "SMS",
      "message_expiry_timestamp": "2016-11-03T11:49:02.807Z",
      "metadata": {
        "key1": "value1",
        "key2": "value2"
      },
      "scheduled": "2016-11-03T11:49:02.807Z",
      "source_number": "+61491570157",
      "source_number_type": "INTERNATIONAL"
    }
  ]
}
```

## Errors

| HTTP Status Code | Error Description | Exception Class |
|  --- | --- | --- |
| 400 | Error | `APIException` |

