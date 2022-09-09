# messages
#
# This file was automatically generated by APIMATIC v2.0
# ( https://apimatic.io ).

module Messages
  # CheckDeliveryReportsResponse Model.
  class CheckDeliveryReportsResponse < BaseModel
    SKIP = Object.new
    private_constant :SKIP

    # TODO: Write general description for this method
    # @return [List of Object]
    attr_accessor :delivery_reports

    # A mapping from model property names to API property names.
    def self.names
      @_hash = {} if @_hash.nil?
      @_hash['delivery_reports'] = 'delivery_reports'
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

    def initialize(delivery_reports = nil)
      @delivery_reports = delivery_reports
    end

    # Creates an instance of the object from a hash.
    def self.from_hash(hash)
      return nil unless hash

      # Extract variables from the hash.
      delivery_reports =
        hash.key?('delivery_reports') ? hash['delivery_reports'] : nil

      # Create object from extracted values.
      CheckDeliveryReportsResponse.new(delivery_reports)
    end
  end
end