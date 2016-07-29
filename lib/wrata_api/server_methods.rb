module WrataApi
  # Methods for getting server status
  module ServerMethods
    # @return [Hash] Return servers data
    def server_data(server_name)
      uri = URI.parse("#{@uri}/runner/updated_data")
      response = perform_get(uri, 'servers[]' => server_name)
      response['servers_data'].first
    end

    # @return [Symbol] if server is powered on or off
    def powering_status(server_name)
      all_data = server_data(server_name)
      status = all_data['_status']
      if status == 'created'
        :on
      elsif status == 'destroyed'
        :off
      else
        :other
      end
    end

    # @return [True, False] check if server execute some test
    def executing_test?(server_name)
      all_data = server_data(server_name)
      all_data.key?('test')
    end

    # @param server_name [Server] server to unbook
    # @return [Nothing]
    def unbook_server(server_name)
      uri = URI.parse("#{@uri}/queue/unbook_server")
      perform_post(uri, 'server' => server_name)
    end

    # @param server_name [Server] server to book
    # @return [Nothing]
    def book_server(server_name)
      uri = URI.parse("#{@uri}/queue/book_server")
      perform_post(uri, 'server' => server_name)
    end

    # Waiting until server have statue
    # @param server [String] name of server
    # @param status [Symbol] state to wait
    # @return [Nothing]
    def wait_for_server_have_status(server, status)
      current_wait_time = 0
      loop do
        return if powering_status(server) == status
        @logger.info("Wait for state: #{status}: \
                      #{current_wait_time} of: #{@waiting_timeout}")
        sleep @between_request_timeout
        current_wait_time += @between_request_timeout
        raise "Couldn't wait until #{server} have status #{status} \
               in specified timeout" if current_wait_time > @waiting_timeout
      end
    end
  end
end
