# messages
#
# This file was automatically generated by APIMATIC v2.0
# ( https://apimatic.io ).

module Messages
  # ConfirmRepliesAsReceivedRequest Model.
  class ConfirmRepliesAsReceivedRequest < BaseModel
    SKIP = Object.new
    private_constant :SKIP

    # TODO: Write general description for this method
    # @return [List of String]
    attr_accessor :reply_ids

    # A mapping from model property names to API property names.
    def self.names
      @_hash = {} if @_hash.nil?
      @_hash['reply_ids'] = 'reply_ids'
      @_hash
    end

    # An array for optional fields
    def self.optionals
      []
    end

    # An array for nullable fields
    def self.nullables
      []
    end

    def initialize(reply_ids = nil)
      @reply_ids = reply_ids
    end

    # Creates an instance of the object from a hash.
    def self.from_hash(hash)
      return nil unless hash

      # Extract variables from the hash.
      reply_ids = hash.key?('reply_ids') ? hash['reply_ids'] : nil

      # Create object from extracted values.
      ConfirmRepliesAsReceivedRequest.new(reply_ids)
    end
  end
end
