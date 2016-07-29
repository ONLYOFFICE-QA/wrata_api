require_relative 'wrata_api/wrata_api_request'
require 'json'
require 'logger'
require 'uri'
module WrataApi
  # Class for working with wrata api
  class WrataApi
    include WrataApiRequest

    def initialize(uri: File.read("#{ENV['HOME']}/.gem-wrata/uri").strip,
                   cookie: File.read("#{ENV['HOME']}/.gem-wrata/cookie").strip)
      @uri = uri
      @cookie = cookie
      @logger = Logger.new(STDOUT)
    end

    # @return [Hash] Return servers data
    def servers_data
      uri = URI.parse("#{@uri}/updated_data")
      JSON.parse(perform_get(uri))
    end
  end
end
