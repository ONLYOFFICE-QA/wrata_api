require_relative 'wrata_api/wrata_api_request'
require_relative 'wrata_api/server_methods'
require 'json'
require 'logger'
require 'uri'
require 'yaml'
module WrataApi
  # Class for working with wrata api
  class WrataApi
    include WrataApiRequest
    include ServerMethods

    def initialize
      config = YAML.load_file("#{ENV['HOME']}/.gem-wrata/config.yaml")
      @uri = config['uri']
      @cookie = config['cookie']
      @wrata_session = config['wrata_session']
      @csrf_token = config['csrf_token']
      @logger = Logger.new(STDOUT)
    end

    # Clear test in queue
    # @return [Nothing]
    def clear_tests_list
      uri = URI.parse("#{@uri}/queue/clear_tests")
      perform_post(uri)
    end
  end
end
