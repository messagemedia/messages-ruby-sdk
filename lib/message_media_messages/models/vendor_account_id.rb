# message_media_messages
#
# This file was automatically generated by APIMATIC v2.0
# ( https://apimatic.io ).

module MessageMediaMessages
  # VendorAccountId Model.
  class VendorAccountId < BaseModel
    # TODO: Write general description for this method
    # @return [String]
    attr_accessor :vendor_id

    # The account used to submit the original message.
    # @return [String]
    attr_accessor :account_id

    # A mapping from model property names to API property names.
    def self.names
      @_hash = {} if @_hash.nil?
      @_hash['vendor_id'] = 'vendor_id'
      @_hash['account_id'] = 'account_id'
      @_hash
    end

    def initialize(vendor_id = nil,
                   account_id = nil)
      @vendor_id = vendor_id
      @account_id = account_id
    end

    # Creates an instance of the object from a hash.
    def self.from_hash(hash)
      return nil unless hash

      # Extract variables from the hash.
      vendor_id = hash['vendor_id']
      account_id = hash['account_id']

      # Create object from extracted values.
      VendorAccountId.new(vendor_id,
                          account_id)
    end
  end
end
