# This file was automatically generated for MessageMedia by APIMATIC v2.0
# ( https://apimatic.io ).

module MessageMediaMessages
  # ConfirmRepliesAsReceivedRequest8 Model.
  class ConfirmRepliesAsReceivedRequest8 < BaseModel
    # TODO: Write general description for this method
    # @return [List of UUID | String]
    attr_accessor :reply_ids

    # A mapping from model property names to API property names.
    def self.names
      if @_hash.nil?
        @_hash = {}
        @_hash['reply_ids'] = 'reply_ids'
      end
      @_hash
    end

    def initialize(reply_ids = nil)
      @reply_ids = reply_ids
    end

    # Creates an instance of the object from a hash.
    def self.from_hash(hash)
      return nil unless hash

      # Extract variables from the hash.
      reply_ids = hash['reply_ids']

      # Create object from extracted values.
      ConfirmRepliesAsReceivedRequest8.new(reply_ids)
    end
  end
end
