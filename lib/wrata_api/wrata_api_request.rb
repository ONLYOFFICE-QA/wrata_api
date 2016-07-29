require 'net/http'
module WrataApi
  # Module for describing base request actions
  module WrataApiRequest
    def default_header
      { 'Cookie' => "remember_token=#{@cookie}; \
                    _runner_session=#{@wrata_session}",
        'X-CSRF-Token' => @csrf_token }
    end

    def perform_get(uri, body = {})
      @header ||= default_header

      http = Net::HTTP.new(uri.host, uri.port)
      request = Net::HTTP::Get.new(uri.request_uri, @header)
      request.set_form_data(body)
      body = http.request(request).body
      @logger.info("Get request: #{uri} answered: #{body}")
      return {} if body.empty?
      JSON.parse(body)
    end

    def perform_post(uri, body = {})
      @header ||= default_header

      http = Net::HTTP.new(uri.host, uri.port)
      request = Net::HTTP::Post.new(uri.request_uri, @header)
      request.set_form_data(body)
      http.read_timeout = 500
      body = http.request(request).body
      @logger.info("Post request: #{uri} answered: #{body}")
      return {} if body.empty?
      JSON.parse(body)
    end
  end
end
