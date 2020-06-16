# frozen_string_literal: true

require 'net/http'
module WrataApi
  # Module for describing base request actions
  module WrataApiRequest
    # @return [Hash] default header for requests
    def default_header
      { 'Cookie' => "remember_token=#{@cookie}; \
                    _runner_session=#{@wrata_session}",
        'X-CSRF-Token' => @csrf_token }
    end

    # Make get request
    # @param uri [URI] uri wiht server
    # @param body [Hash] body of request
    # @return [JSON] result of request
    def perform_get(uri, body = {})
      request = Net::HTTP::Get.new(uri.request_uri, default_header)
      request.set_form_data(body)
      body = http_object(uri).request(request).body
      @logger.info("Get request: #{uri} answered: #{body}")
      return {} if body.empty?

      JSON.parse(body)
    end

    # Make post request
    # @param uri [URI] uri wiht server
    # @param body [Hash] body of request
    # @return [JSON] result of request
    def perform_post(uri, body = {})
      http = http_object(uri)
      request = Net::HTTP::Post.new(uri.request_uri, default_header)
      request.set_form_data(body)
      http.read_timeout = 500
      body = http.request(request).body
      @logger.info("Post request: #{uri} answered: #{body}")
      return {} if body.empty?

      JSON.parse(body)
    end

    # @param uri [URI] url of server
    # @return [Net:HTTP] http instance
    def http_object(uri)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true if uri.scheme == 'https'
      http
    end
  end
end
