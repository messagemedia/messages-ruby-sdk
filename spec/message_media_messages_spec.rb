module MessageMediaMessages
  RSpec.describe MessageMediaMessages do
    before do
      stub_request(:post, "https://api.messagemedia.com/v1/messages").
      with(
         body: "{\"messages\":[{\"content\":\"My first message\",\"destination_number\":\"+61491570156\",\"delivery_report\":false}]}",
         headers: {
        'Accept'=>'application/json',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'Authorization'=>'Basic QVBJX0tFWTpBUElfU0VDUkVU',
        'Content-Type'=>'application/json; charset=utf-8',
        'User-Agent'=>'messagemedia-messages'
         }).
       to_return(status: 200, body: {messages: [
        { "callback_url": "https://my.url.com",
          "content": "Hello world!",
          "destination_number": "+61491570156",
          "delivery_report": false,
          "format": "SMS",
          "message_expiry_timestamp": "2019-10-12T07:20:50.52Z",
          "metadata": { },
          "scheduled": "2019-10-12T07:20:50.52Z",
          "source_number": "+61491570156",
          "source_number_type": "INTERNATIONAL",
          "message_id": "d7d9d9fd-478f-40e6-b651-49b7f19878a2",
          "status": "enroute",
          "media": [],
          "subject": "string" }
        ]}.to_json, headers: {})
    end

    it "works with README example" do
      auth_user_name = 'API_KEY'
      auth_password = 'API_SECRET'
      use_hmac = false

      client = MessageMediaMessagesClient.new(
        auth_user_name: auth_user_name,
        auth_password: auth_password,
        use_hmac_authentication: use_hmac
      )

      messages_controller = client.messages
      body = SendMessagesRequest.new
      body.messages = []

      body.messages[0] = Message.new
      body.messages[0].content = 'My first message'
      body.messages[0].destination_number = '+61491570156'
      result = messages_controller.send_messages(body)
      expect(result.messages.first.to_hash).to eq(
        "callback_url" => "https://my.url.com",
        "content" => "Hello world!",
        "destination_number" => "+61491570156",
        "delivery_report" => false,
        "format" => "SMS",
        "message_expiry_timestamp" => DateTime.parse("2019-10-12T07:20:50.52Z"),
        "metadata" => { },
        "scheduled" => DateTime.parse("2019-10-12T07:20:50.52Z"),
        "source_number" => "+61491570156",
        "source_number_type" => "INTERNATIONAL",
        "message_id" => "d7d9d9fd-478f-40e6-b651-49b7f19878a2",
        "status" => "enroute",
        "media" => [],
        "subject" => "string"
      )
    end
  end
end
