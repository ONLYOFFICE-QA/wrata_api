# frozen_string_literal: true

module WrataApi
  # Class for working with several servers at once
  class ServerList
    # @return [Array, Hash] list of servers
    attr_accessor :servers

    def initialize(api)
      @api = api
      @servers = []
      @concurrent_operation_at_once = 5
    end

    # @return [Integer] count of servers
    def length
      @servers.length
    end

    # Turn on all servers in list
    def concurrent_action
      splitted_servers = @servers.each_slice(@concurrent_operation_at_once).to_a
      splitted_servers.each do |each_slice|
        threads = each_slice.map do |current_server|
          Thread.new(current_server) do
            yield(current_server)
          end
        end
        threads.each(&:join)
      end
    end

    # Power on all servers
    # @return [Nothing]
    def power_on(size = nil)
      concurrent_action do |server|
        @api.power_on_server(server['name'], size)
      end
    end

    # @return [True, False] is all servers powered on?
    def powered_on?
      @servers.each do |current|
        return false unless @api.powering_status(current['name']) == :on
      end
      true
    end

    # Power on all servers
    # @return [Nothing]
    def power_off
      concurrent_action do |server|
        @api.power_off_server(server['name'])
      end
    end

    # @return [True, False] is all servers powered on?
    def powered_off?
      @servers.each do |current|
        return false unless @api.powering_status(current['name']) == :off
      end
      true
    end

    # Book each server
    # @return [Nothing]
    def book
      @servers.each do |current|
        @api.book_server(current['name'])
      end
    end

    # Unbook each server
    # @return [Nothing]
    def unbook
      @servers.each do |current|
        @api.unbook_server(current['name'])
      end
    end
  end
end
