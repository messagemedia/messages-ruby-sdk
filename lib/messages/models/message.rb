# messages
#
# This file was automatically generated by APIMATIC v2.0
# ( https://apimatic.io ).

require 'date'
module Messages
  # Message Model.
  class Message < BaseModel
    SKIP = Object.new
    private_constant :SKIP

    # URL replies and delivery reports to this message will be pushed to
    # @return [String]
    attr_accessor :callback_url

    # Content of the message
    # @return [String]
    attr_accessor :content

    # Destination number of the message
    # @return [String]
    attr_accessor :destination_number

    # Request a delivery report for this message
    # @return [TrueClass|FalseClass]
    attr_accessor :delivery_report

    # Format of message, SMS, MMS or TTS (Text To Speech).
    # @return [List of FormatEnum]
    attr_accessor :format

    # Format of message, SMS, MMS or TTS (Text To Speech).
    # @return [List of String]
    attr_accessor :media

    # Date time after which the message expires and will not be sent
    # @return [DateTime]
    attr_accessor :message_expiry_timestamp

    # Metadata for the message specified as a set of key value pairs, each key
    # can be up to 100 characters long and each value can be up to 256
    # characters long
    # ```
    # {
    #    "myKey": "myValue",
    #    "anotherKey": "anotherValue"
    # }
    # ```
    # @return [Object]
    attr_accessor :metadata

    # Scheduled delivery date time of the message
    # @return [DateTime]
    attr_accessor :scheduled

    # Scheduled delivery date time of the message
    # @return [String]
    attr_accessor :source_number

    # Type of source address specified, this can be INTERNATIONAL, ALPHANUMERIC
    # or SHORTCODE
    # @return [SourceNumberTypeEnum]
    attr_accessor :source_number_type

    # A mapping from model property names to API property names.
    def self.names
      @_hash = {} if @_hash.nil?
      @_hash['callback_url'] = 'callback_url'
      @_hash['content'] = 'content'
      @_hash['destination_number'] = 'destination_number'
      @_hash['delivery_report'] = 'delivery_report'
      @_hash['format'] = 'format'
      @_hash['media'] = 'media'
      @_hash['message_expiry_timestamp'] = 'message_expiry_timestamp'
      @_hash['metadata'] = 'metadata'
      @_hash['scheduled'] = 'scheduled'
      @_hash['source_number'] = 'source_number'
      @_hash['source_number_type'] = 'source_number_type'
      @_hash
    end

    # An array for optional fields
    def self.optionals
      %w[
        callback_url
        delivery_report
        format
        media
        message_expiry_timestamp
        metadata
        scheduled
        source_number
        source_number_type
      ]
    end

    # An array for nullable fields
    def self.nullables
      []
    end

    def initialize(content = nil,
                   destination_number = nil,
                   callback_url = SKIP,
                   delivery_report = false,
                   format = SKIP,
                   media = SKIP,
                   message_expiry_timestamp = SKIP,
                   metadata = SKIP,
                   scheduled = SKIP,
                   source_number = SKIP,
                   source_number_type = SKIP)
      @callback_url = callback_url unless callback_url == SKIP
      @content = content
      @destination_number = destination_number
      @delivery_report = delivery_report unless delivery_report == SKIP
      @format = format unless format == SKIP
      @media = media unless media == SKIP
      @message_expiry_timestamp = message_expiry_timestamp unless message_expiry_timestamp == SKIP
      @metadata = metadata unless metadata == SKIP
      @scheduled = scheduled unless scheduled == SKIP
      @source_number = source_number unless source_number == SKIP
      @source_number_type = source_number_type unless source_number_type == SKIP
    end

    # Creates an instance of the object from a hash.
    def self.from_hash(hash)
      return nil unless hash

      # Extract variables from the hash.
      content = hash.key?('content') ? hash['content'] : nil
      destination_number =
        hash.key?('destination_number') ? hash['destination_number'] : nil
      callback_url = hash.key?('callback_url') ? hash['callback_url'] : SKIP
      delivery_report = hash['delivery_report'] ||= false
      format = hash.key?('format') ? hash['format'] : SKIP
      media = hash.key?('media') ? hash['media'] : SKIP
      message_expiry_timestamp = if hash.key?('message_expiry_timestamp')
                                   (DateTimeHelper.from_rfc3339(hash['message_expiry_timestamp']) if hash['message_expiry_timestamp'])
                                 else
                                   SKIP
                                 end
      metadata = hash.key?('metadata') ? hash['metadata'] : SKIP
      scheduled = if hash.key?('scheduled')
                    (DateTimeHelper.from_rfc3339(hash['scheduled']) if hash['scheduled'])
                  else
                    SKIP
                  end
      source_number = hash.key?('source_number') ? hash['source_number'] : SKIP
      source_number_type =
        hash.key?('source_number_type') ? hash['source_number_type'] : SKIP

      # Create object from extracted values.
      Message.new(content,
                  destination_number,
                  callback_url,
                  delivery_report,
                  format,
                  media,
                  message_expiry_timestamp,
                  metadata,
                  scheduled,
                  source_number,
                  source_number_type)
    end

    def to_message_expiry_timestamp
      DateTimeHelper.to_rfc3339(message_expiry_timestamp)
    end

    def to_scheduled
      DateTimeHelper.to_rfc3339(scheduled)
    end
  end
end