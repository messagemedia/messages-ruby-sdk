# This file was automatically generated for MessageMedia by APIMATIC v2.0
# ( https://apimatic.io ).

module MessageMediaMessages
  # API utility class
  # noinspection RubyClassMethodNamingConvention
  class APIHelper
    # Serializes an array parameter (creates key value pairs).
    # @param [String] The name of the parameter.
    # @param [Array] The value of the parameter.
    # @param [String] The format of the serialization.
    def self.serialize_array(key, array, formatting: 'indexed')
      tuples = []

      if formatting == 'unindexed'
        tuples += array.map { |element| ["#{key}[]", element] }
      elsif formatting == 'indexed'
        tuples += array.map.with_index do |element, index|
          ["#{key}[#{index}]", element]
        end
      elsif formatting == 'plain'
        tuples += array.map { |element| [key, element] }
      else
        raise ArgumentError, 'Invalid format provided.'
      end
      tuples
    end

    # Replaces template parameters in the given url.
    # @param [String] The query string builder to replace the template
    # parameters.
    # @param [Hash] The parameters to replace in the url.
    def self.append_url_with_template_parameters(query_builder, parameters)
      # perform parameter validation
      unless query_builder.instance_of? String
        raise ArgumentError, 'Given value for parameter \"query_builder\" is
          invalid.'
      end

      # Return if there are no parameters to replace.
      return query_builder if parameters.nil?

      # Iterate and append parameters.
      parameters.each do |key, value|
        if value.nil?
          replace_value = ''
        elsif value.instance_of? Array
          value.map! { |element| CGI.escape(element.to_s) }
          replace_value = value.join('/')
        else
          replace_value = CGI.escape(value.to_s)
        end

        # Find the template parameter and replace it with its value.
        query_builder = query_builder.gsub('{' + key.to_s + '}', replace_value)
      end
      query_builder
    end

    # Appends the given set of parameters to the given query string.
    # @param [String] The query string builder to add the query parameters to.
    # @param [Hash] The parameters to append.
    # @param [String] The format of array parameter serialization.
    def self.append_url_with_query_parameters(query_builder, parameters,
                                              array_serialization: 'indexed')
      # Perform parameter validation.
      unless query_builder.instance_of? String
        raise ArgumentError, 'Given value for parameter \"query_builder\"
          is invalid.'
      end

      # Return if there are no parameters to replace.
      return query_builder if parameters.nil?

      parameters.each do |key, value|
        seperator = query_builder.include?('?') ? '&' : '?'
        unless value.nil?
          if value.instance_of? Array
            value.compact!
            query_builder += if array_serialization == 'csv'
                               "#{seperator}#{key}=#{value.map do |element|
                                 CGI.escape(element.to_s)
                               end.join(',')}"
                             elsif array_serialization == 'psv'
                               "#{seperator}#{key}=#{value.map do |element|
                                 CGI.escape(element.to_s)
                               end.join('|')}"
                             elsif array_serialization == 'tsv'
                               "#{seperator}#{key}=#{value.map do |element|
                                 CGI.escape(element.to_s)
                               end.join('\t')}"
                             else
                               "#{seperator}#{APIHelper.serialize_array(
                                 key, value, formatting: array_serialization
                               ).map { |k, v| "#{k}=#{CGI.escape(v.to_s)}" }
                               .join('&')}"
                             end
          else
            query_builder += "#{seperator}#{key}=#{CGI.escape(value.to_s)}"
          end
        end
      end
      query_builder
    end

    # Validates and processes the given Url.
    # @param [String] The given Url to process.
    # @return [String] Pre-processed Url as string.
    def self.clean_url(url)
      # Perform parameter validation.
      raise ArgumentError, 'Invalid Url.' unless url.instance_of? String

      # Ensure that the urls are absolute.
      matches = url.match(%r{^(https?:\/\/[^\/]+)})
      raise ArgumentError, 'Invalid Url format.' if matches.nil?

      # Get the http protocol match.
      protocol = matches[1]

      # Check if parameters exist.
      index = url.index('?')

      # Remove redundant forward slashes.
      query = url[protocol.length...(!index.nil? ? index : url.length)]
      query.gsub!(%r{\/\/+}, '/')

      # Get the parameters.
      parameters = !index.nil? ? url[url.index('?')...url.length] : ''

      # Return processed url.
      protocol + query + parameters
    end

    # Parses JSON string.
    # @param [String] A JSON string.
    def self.json_deserialize(json)
      return JSON.parse(json)
    rescue StandardError
      raise TypeError, 'Server responded with invalid JSON.'
    end

    # Removes elements with empty values from a hash.
    # @param [Hash] The hash to clean.
    def self.clean_hash(hash)
      hash.delete_if { |_key, value| value.to_s.strip.empty? }
    end

    # Form encodes a hash of parameters.
    # @param [Hash] The hash of parameters to encode.
    # @return [Hash] A hash with the same parameters form encoded.
    def self.form_encode_parameters(form_parameters)
      encoded = {}
      form_parameters.each do |key, value|
        encoded.merge!(APIHelper.form_encode(value, key))
      end
      encoded
    end

    # Form encodes an object.
    # @param [Dynamic] An object to form encode.
    # @param [String] The name of the object.
    # @return [Hash] A form encoded representation of the object in the form
    # of a hash.
    def self.form_encode(obj, instance_name)
      retval = {}

      # If this is a structure, resolve it's field names.
      obj = obj.to_hash if obj.is_a? BaseModel

      # Create a form encoded hash for this object.
      if obj.nil?
        nil
      elsif obj.instance_of? Array
        obj.each_with_index do |value, index|
          retval.merge!(APIHelper.form_encode(value, instance_name + '[' +
            index.to_s + ']'))
        end
      elsif obj.instance_of? Hash
        obj.each do |key, value|
          retval.merge!(APIHelper.form_encode(value, instance_name + '[' +
            key + ']'))
        end
      else
        retval[instance_name] = obj
      end
      retval
    end
  end
end

# Extend types to support to_bool.
module ToBoolean
  def to_bool
    return true if self == true || to_s.strip =~ /^(true|yes|y|1)$/i
    false
  end
end

# Extend NilClass type to support to_bool.
class NilClass; include ToBoolean; end
# Extend TrueClass type to support to_bool.
class TrueClass; include ToBoolean; end
# Extend FalseClass type to support to_bool.
class FalseClass; include ToBoolean; end
# Extend Numeric type to support to_bool.
class Numeric; include ToBoolean; end
# Extend String type to support to_bool.
class String; include ToBoolean; end
