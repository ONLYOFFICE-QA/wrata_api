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
    # @return [Nothing]
    def tests_in_queue
      uri = URI.parse("#{@uri}/runner/updated_data")
      response = perform_get(uri)
      response['queue_data']['tests'].map { |test| test['test_name'] }
    end

    # Add test to queue
    # @param tests_to_add [String] path to add test
    # @param options [Hash] string of some options
    # @return [Nothing]
    def add_to_queue(tests_to_add, options = {})
      uri = URI.parse("#{@uri}/queue/add_test")

      options[:branch] ||= 'develop'
      options[:location] ||= 'info us'
      body = {
        'test_path' => cleanup_test_path(tests_to_add),
        'branch' => options[:branch],
        'location' => options[:location]
      }
      perform_post(uri, body)
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

    # Change tests path, so it will be not relative to PC
    # @param test_path [String] string to clean
    # @return [String]
    def cleanup_test_path(test_path)
      part_after_root = test_path.split('RubymineProjects')[1]
      "//home/ubuntu/RubymineProjects#{part_after_root}"
    end
  end
end
