# This file was automatically generated for MessageMedia by APIMATIC v2.0 ( https://apimatic.io ).

require 'tempfile'
require 'open-uri'

class TestHelper

  @cache = Hash.new

  # Class method to compare the received headers with the expected headers.
  # @param [Hash] A hash of expected headers (keys in lower case).
  # @param [Hash] A hash of received headers.
  # @param [Boolean, optional] A flag which determines if we allow extra headers.
  def self.match_headers(expected_headers,
                         received_headers,
                         allow_extra: true)
    return false if ((received_headers.length < expected_headers.length) ||
                    ((allow_extra == false) && (received_headers.length > expected_headers.length)))

    received_headers = Hash[received_headers.map{|k, v| [k.to_s.downcase, v]}]
    expected_headers.each do |e_key, e_value|
      return false unless received_headers.key?(e_key)
      return false if ((e_value != nil) &&
                       (e_value != received_headers[e_key]))
    end

    return true
  end

  # Class method to compare the received body with the expected body.
  # @param [Dynamic] The expected body.
  # @param [Dynamic] The received body.
  # @param [Boolean, optional] A flag which determines if we check values in dictionaries.
  # @param [Boolean, optional] A flag which determines if we check the order of array elements.
  # @param [Boolean, optional] A flag which determines if we check the count of array elements.
  def self.match_body(expected_body,
                      received_body,
                      check_values: false,
                      check_order: false,
                      check_count: false)
    if expected_body.instance_of? Hash
      return false unless received_body.instance_of? Hash
      for key in expected_body.keys           
        return false unless received_body.keys.include? key
        if check_values or expected_body[key].instance_of? Hash
          return false unless TestHelper.match_body(expected_body[key], 
                                                    received_body[key], 
                                                    check_values: check_values, 
                                                    check_order: check_order, 
                                                    check_count: check_count)
        end
      end
    elsif expected_body.instance_of? Array
      return False unless received_body.instance_of? Array
      if check_count == true && (expected_body.length != received_body.length)
        return false
      else
        previous_matches = Array.new
        expected_body.each.with_index do |expected_element, i|
          matches = (received_body.map.with_index do |received_element, j|
                      j if TestHelper.match_body(expected_element, 
                                                 received_element, 
                                                 check_values: check_values, 
                                                 check_order: check_order, 
                                                 check_count: check_count)
                    end).compact
          return false if matches.length == 0
          if check_order == true
            return false if (i != 0 && matches.map{|x| previous_matches.map{|y| y > x}.all?}.all?)
            previous_matches = matches
          end
        end
      end
    elsif expected_body != received_body
      return false
    end
    return true
  end  
  
  # Class method which takes a URL, downloads the file (if not already downloaded 
  # for this test session) and returns the path of the file.
  # @param [String] The URL of the required file.
  def self.get_file(url)
    unless @cache.keys.include? url  
      @cache[url] = Tempfile.new('APIMatic')
      @cache[url].binmode
      @cache[url].write(open(url, {ssl_ca_cert: Certifi.where}).read)
    end
    return @cache[url].path
  end
end