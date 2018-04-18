require 'message_media_messages'

# Configuration parameters and credentials
auth_user_name = 'WjO4JBbdNHHPmLQC5fZO' # The username to use with basic/HMAC authentication
auth_password = 'psh1ec3gZvDv3mxOGU52oXy1tKTYpn' # The password to use with basic/HMAC authentication
use_hmac = false # Change this to true if you are using HMAC keys

client = MessageMediaMessages::MessageMediaMessagesClient.new(
    auth_user_name: auth_user_name,
    auth_password: auth_password,
    use_hmac: use_hmac
)

replies = client.replies

result = replies.get_check_replies()
print result.inspect
