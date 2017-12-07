# This file was automatically generated for MessageMedia by APIMATIC v2.0 ( https://apimatic.io ).

require_relative 'controller_test_base'

# noinspection RubyClassVariableUsageInspection,RubyInstanceMethodNamingConvention
class DeliveryReportsControllerTests < ControllerTestBase
  # Called only once for the class before any test has executed
  def self.startup
    self.controller = @@api_client.delivery_reports
  end

  # Check for any delivery reports that have been received.
  # Delivery reports are a notification of the change in status of a message as it is being processed.
  # Each request to the check delivery reports endpoint will return any delivery reports received that
  # have not yet been confirmed using the confirm delivery reports endpoint. A response from the check
  # delivery reports endpoint will have the following structure:
  # ```json
  # {
  #     "delivery_reports": [
  #         {
  #             "callback_url": "https://my.callback.url.com",
  #             "delivery_report_id": "01e1fa0a-6e27-4945-9cdb-18644b4de043",
  #             "source_number": "+61491570157",
  #             "date_received": "2017-05-20T06:30:37.642Z",
  #             "status": "enroute",
  #             "delay": 0,
  #             "submitted_date": "2017-05-20T06:30:37.639Z",
  #             "original_text": "My first message!",
  #             "message_id": "d781dcab-d9d8-4fb2-9e03-872f07ae94ba",
  #             "vendor_account_id": {
  #                 "vendor_id": "MessageMedia",
  #                 "account_id": "MyAccount"
  #             },
  #             "metadata": {
  #                 "key1": "value1",
  #                 "key2": "value2"
  #             }
  #         },
  #         {
  #             "callback_url": "https://my.callback.url.com",
  #             "delivery_report_id": "0edf9022-7ccc-43e6-acab-480e93e98c1b",
  #             "source_number": "+61491570158",
  #             "date_received": "2017-05-21T01:46:42.579Z",
  #             "status": "enroute",
  #             "delay": 0,
  #             "submitted_date": "2017-05-21T01:46:42.574Z",
  #             "original_text": "My second message!",
  #             "message_id": "fbb3b3f5-b702-4d8b-ab44-65b2ee39a281",
  #             "vendor_account_id": {
  #                 "vendor_id": "MessageMedia",
  #                 "account_id": "MyAccount"
  #             },
  #             "metadata": {
  #                 "key1": "value1",
  #                 "key2": "value2"
  #             }
  #         }
  #     ]
  # }
  # ```
  # Each delivery report will contain details about the message, including any metadata specified
  # and the new status of the message (as each delivery report indicates a change in status of a
  # message) and the timestamp at which the status changed. Every delivery report will have a
  # unique delivery report ID for use with the confirm delivery reports endpoint.
  # *Note: The source number and destination number properties in a delivery report are the inverse of
  # those specified in the message that the delivery report relates to. The source number of the
  # delivery report is the destination number of the original message.*
  # Subsequent requests to the check delivery reports endpoint will return the same delivery reports
  # and a maximum of 100 delivery reports will be returned in each request. Applications should use the
  # confirm delivery reports endpoint in the following pattern so that delivery reports that have been
  # processed are no longer returned in subsequent check delivery reports requests.
  # 1. Call check delivery reports endpoint
  # 2. Process each delivery report
  # 3. Confirm all processed delivery reports using the confirm delivery reports endpoint
  # *Note: It is recommended to use the Webhooks feature to receive reply messages rather than
  # polling the check delivery reports endpoint.*
  def test_check_delivery_reports_1

    # Perform the API call through the SDK function
    result = self.class.controller.get_check_delivery_reports

    # Test response code
    assert_equal(@response_catcher.response.status_code, 200)

    # Test headers
    expected_headers = {}
    expected_headers['content-type'] = nil

    assert(TestHelper.match_headers(expected_headers, @response_catcher.response.headers))

    # Test whether the captured response is as we expected
    assert_not_nil(result)
    assert_true(@response_catcher.response.raw_body.index('{"delivery_reports":[') >= 0, "Must get our delivery reports")
  end

  # Make sure our SDK fails when passed an invalid account id
  def test_check_delivery_reports_with_invalid_account
    begin
      # Perform the API call through the SDK function
      self.class.controller.get_check_delivery_reports('INVALID ACCOUNT')
    rescue APIException => api_exception
      assert_equal('HTTP Response Not OK. {"message":"Invalid account \'INVALID ACCOUNT\' in header Account"}' + "\n",
                   api_exception.message,'Make sure we''ve got our error message')
      # Test response code
      assert_equal(@response_catcher.response.status_code, 403)
    end
  end

  # Mark a delivery report as confirmed so it is no longer return in check delivery reports requests.
  # The confirm delivery reports endpoint is intended to be used in conjunction with the check delivery
  # reports endpoint to allow for robust processing of delivery reports. Once one or more delivery
  # reports have been processed, they can then be confirmed using the confirm delivery reports endpoint so they
  # are no longer returned in subsequent check delivery reports requests.
  # The confirm delivery reports endpoint takes a list of delivery report IDs as follows:
  # ```json
  # {
  #     "delivery_report_ids": [
  #         "011dcead-6988-4ad6-a1c7-6b6c68ea628d",
  #         "3487b3fa-6586-4979-a233-2d1b095c7718",
  #         "ba28e94b-c83d-4759-98e7-ff9c7edb87a1"
  #     ]
  # }
  # ```
  # Up to 100 delivery reports can be confirmed in a single confirm delivery reports request.
  def test_confirm_delivery_reports_as_received_1
    # Parameters for the API call
    body = ConfirmDeliveryReportsAsReceivedRequest.from_hash(JSON.parse(
      '{"delivery_report_ids":["011dcead-6988-4ad6-a1c7-6b6c68ea628d","3487b3fa-65'\
      '86-4979-a233-2d1b095c7718","ba28e94b-c83d-4759-98e7-ff9c7edb87a1"]}'
      ))

    # Perform the API call through the SDK function
    self.class.controller.create_confirm_delivery_reports_as_received(body)

    # Test response code
    assert_equal(@response_catcher.response.status_code, 202)

    # Test headers
    expected_headers = {}
    expected_headers['content-type'] = nil

    assert(TestHelper.match_headers(expected_headers, @response_catcher.response.headers))
  end

  # Make sure our SDK fails when passed an invalid account id
  def test_confirm_delivery_reports_as_received_with_invalid_account
    begin
      # Perform the API call through the SDK function
      body = ConfirmDeliveryReportsAsReceivedRequest.from_hash(JSON.parse(
          '{"delivery_report_ids":["011dcead-6988-4ad6-a1c7-6b6c68ea628d","3487b3fa-65'\
      '86-4979-a233-2d1b095c7718","ba28e94b-c83d-4759-98e7-ff9c7edb87a1"]}'
      ))

      # Perform the API call through the SDK function
      self.class.controller.create_confirm_delivery_reports_as_received(body, 'INVALID ACCOUNT')
    rescue APIException => api_exception
      assert_equal('HTTP Response Not OK. {"message":"Invalid account \'INVALID ACCOUNT\' in header Account"}' + "\n",
                   api_exception.message,'Make sure we''ve got our error message')
      # Test response code
      assert_equal(@response_catcher.response.status_code, 403)
    end
  end

end