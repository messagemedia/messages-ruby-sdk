# This file was automatically generated for MessageMedia by APIMATIC v2.0
# ( https://apimatic.io ).

module MessageMediaMessages
  # CheckDeliveryReportsResponse Model.
  class CheckDeliveryReportsResponse < BaseModel
    # TODO: Write general description for this method
    # @return [List of Object]
    attr_accessor :delivery_reports

    # A mapping from model property names to API property names.
    def self.names
      if @_hash.nil?
        @_hash = {}
        @_hash['delivery_reports'] = 'delivery_reports'
      end
      @_hash
    end

    def initialize(delivery_reports = nil)
      @delivery_reports = delivery_reports
    end

    # Creates an instance of the object from a hash.
    def self.from_hash(hash)
      return nil unless hash

      # Extract variables from the hash.
      delivery_reports = hash['delivery_reports']

      # Create object from extracted values.
      CheckDeliveryReportsResponse.new(delivery_reports)
    end
  end
end
