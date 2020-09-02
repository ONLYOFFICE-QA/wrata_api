# frozen_string_literal: true

# Module to work with clients api
module ClientsMethods
  # Get current user info
  # @return [Array<Hash>] current user info
  def profile
    uri = URI.parse("#{@uri}/profile.json")
    perform_get(uri)
  end
end
