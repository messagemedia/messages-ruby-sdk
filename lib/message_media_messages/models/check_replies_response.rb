# This file was automatically generated for MessageMedia by APIMATIC v2.0
# ( https://apimatic.io ).

module MessageMediaMessages
  # CheckRepliesResponse Model.
  class CheckRepliesResponse < BaseModel
    # TODO: Write general description for this method
    # @return [List of Object]
    attr_accessor :replies

    # A mapping from model property names to API property names.
    def self.names
      if @_hash.nil?
        @_hash = {}
        @_hash['replies'] = 'replies'
      end
      @_hash
    end

    def initialize(replies = nil)
      @replies = replies
    end

    # Creates an instance of the object from a hash.
    def self.from_hash(hash)
      return nil unless hash

      # Extract variables from the hash.
      replies = hash['replies']

      # Create object from extracted values.
      CheckRepliesResponse.new(replies)
    end
  end
end
