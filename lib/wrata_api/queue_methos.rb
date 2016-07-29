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
    # @return[]
    def tests_in_queue
      uri = URI.parse("#{@uri}/runner/updated_data")
      response = perform_get(uri)
      response['queue_data']['tests'].map { |test| test['test_name'] }
    end
  end
end
