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
  end
end
