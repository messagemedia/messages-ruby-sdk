# This file was automatically generated for MessageMedia by APIMATIC v2.0
# ( https://apimatic.io ).

module MessageMediaMessages
  # SendMessagesResponse Model.
  class SendMessagesResponse < BaseModel
    # TODO: Write general description for this method
    # @return [List of Object]
    attr_accessor :messages

    # A mapping from model property names to API property names.
    def self.names
      if @_hash.nil?
        @_hash = {}
        @_hash['messages'] = 'messages'
      end
      @_hash
    end

    def initialize(messages = nil)
      @messages = messages
    end

    # Creates an instance of the object from a hash.
    def self.from_hash(hash)
      return nil unless hash

      # Extract variables from the hash.
      messages = hash['messages']

      # Create object from extracted values.
      SendMessagesResponse.new(messages)
    end
  end
end
