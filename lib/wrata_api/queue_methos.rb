# frozen_string_literal: true

module WrataApi
  # Methods for working with queue
  module QueueMethods
    # Clear test in queue
    # @return [Nothing]
    def clear_tests_list
      uri = URI.parse("#{@uri}/queue/clear_tests")
      perform_post(uri)
    end

    # Get list of tests in queue
    # @return [Array<Hash>] test list data
    def tests_in_queue
      uri = URI.parse("#{@uri}/runner/updated_data")
      response = perform_get(uri)
      response['queue_data']['tests']
    end

    # Add test to queue
    # @param tests_to_add [String] path to add test
    # @param options [Hash] string of some options
    # @return [Nothing]
    def add_to_queue(tests_to_add, options = {})
      uri = URI.parse("#{@uri}/queue/add_test")

      options = queue_item_default_values(options)
      body = {
        'test_path' => tests_to_add,
        'branch' => options[:branch],
        'location' => options[:location],
        'spec_browser' => options[:browser]
      }
      perform_post(uri, body)
    end

    # Add default value to queue item
    # @param options [Hash] values for add to queue
    # @return [Hash] after adding default
    def queue_item_default_values(options)
      options[:branch] ||= 'develop'
      options[:location] ||= 'info us'
      options[:browser] ||= 'default'
      options
    end

    # Add several tests to queue
    # @param test_list [Array, String] tests to add
    # @param options [Hash] option to each test
    # @return [Nothing]
    def add_tests_to_queue(test_list, options = {})
      test_list.each do |current_test|
        add_to_queue(current_test, options)
      end
    end
  end
end
