# This file was automatically generated for MessageMedia by APIMATIC v2.0
# ( https://apimatic.io ).

module MessageMediaMessages
  # CancelScheduledMessageRequest Model.
  class CancelScheduledMessageRequest < BaseModel
    # TODO: Write general description for this method
    # @return [String]
    attr_accessor :status

    # A mapping from model property names to API property names.
    def self.names
      if @_hash.nil?
        @_hash = {}
        @_hash['status'] = 'status'
      end
      @_hash
    end

    def initialize(status = nil)
      @status = status
    end

    # Creates an instance of the object from a hash.
    def self.from_hash(hash)
      return nil unless hash

      # Extract variables from the hash.
      status = hash['status']

      # Create object from extracted values.
      CancelScheduledMessageRequest.new(status)
    end
  end
end
