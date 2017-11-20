# This file was automatically generated for MessageMedia by APIMATIC v2.0
# ( https://apimatic.io ).

module MessageMediaMessages
  # ConfirmDeliveryReportsAsReceivedRequest11 Model.
  class ConfirmDeliveryReportsAsReceivedRequest11 < BaseModel
    # TODO: Write general description for this method
    # @return [List of UUID | String]
    attr_accessor :delivery_report_ids

    # A mapping from model property names to API property names.
    def self.names
      if @_hash.nil?
        @_hash = {}
        @_hash['delivery_report_ids'] = 'delivery_report_ids'
      end
      @_hash
    end

    def initialize(delivery_report_ids = nil)
      @delivery_report_ids = delivery_report_ids
    end

    # Creates an instance of the object from a hash.
    def self.from_hash(hash)
      return nil unless hash

      # Extract variables from the hash.
      delivery_report_ids = hash['delivery_report_ids']

      # Create object from extracted values.
      ConfirmDeliveryReportsAsReceivedRequest11.new(delivery_report_ids)
    end
  end
end
