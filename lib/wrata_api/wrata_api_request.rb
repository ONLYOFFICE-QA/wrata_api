require 'net/http'
module WrataApi
  # Module for describing base request actions
  module WrataApiRequest
    def default_header
      { 'Cookie' => "remember_token=#{@cookie}" }
    end

    def perform_get(uri, body = {})
      @header ||= default_header

      http = Net::HTTP.new(uri.host, uri.port)
      request = Net::HTTP::Get.new(uri.request_uri, @header)
      request.set_form_data(body)
      body = http.request(request).body
      @logger.info("Request: #{uri} answered: #{body}")
      body
    end
  end
end
