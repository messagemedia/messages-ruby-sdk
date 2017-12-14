# This file was automatically generated for MessageMedia by APIMATIC v2.0
# ( https://apimatic.io ).

require 'base64'

module MessageMediaMessages
  # Utility class for basic authorization.
  class HmacAuth
    def self.create_signature(date, content_signature, url, body=nil)
      request_type = "GET"

      if body != nil
        request_type = "POST"
      end

      signing_string = "date: #{date}\n#{content_signature}#{request_type} #{url} HTTP/1.1"
      hmac = OpenSSL::HMAC.digest(OpenSSL::Digest::Digest.new('sha1'), Configuration.hmac_auth_password.encode("ASCII"), signing_string.encode("ASCII"))

      return Base64.encode64(hmac).chomp
    end

    # Add basic authentication to the request.
    # @param [HttpRequest] The HttpRequest object to which authentication will
    # be added.
    def self.apply(http_request, url=nil, body=nil)
      username = Configuration.hmac_auth_user_name

      content_signature = ""
      content_header = ""

      now = DateTime.now.new_offset(0).to_time.strftime("%a, %d %b %Y %H:%M:%S GMT")

      date_header = now

      if body != nil
        md5 = Digest::MD5.new
        md5.update(body)

        content_hash = md5.hexdigest
        content_signature = "x-Content-MD5: #{content_hash}\n"
        content_header = "x-Content-MD5 "
        http_request.headers["x-Content-MD5"] = content_hash
      end

      http_request.headers["date"] = date_header

      hmac_signature = HmacAuth.create_signature(date_header, content_signature, url, body)

      joined = "username=\"#{username}\", algorithm=\"hmac-sha1\", headers=\"date #{content_header}request-line\", signature=\"#{hmac_signature}\""
      header_value = "hmac #{joined}"
      http_request.headers["Authorization"] = header_value
    end
  end
end
