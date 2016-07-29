module WrataApi
  # Class for working with several servers at once
  class ServerList
    # @return [Array, Hash] list of servers
    attr_accessor :servers

    def initialize(api)
      @api = api
      @servers = []
    end

    # @return [Integer] count of servers
    def length
      @servers.length
    end
  end
end
