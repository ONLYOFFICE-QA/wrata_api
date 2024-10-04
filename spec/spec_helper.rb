# frozen_string_literal: true

require 'simplecov'
SimpleCov.start

if ENV['CI']
  require 'simplecov-cobertura'
  SimpleCov.formatter = SimpleCov::Formatter::CoberturaFormatter
end

require 'webmock/rspec'
require 'wrata_api'

RSpec.configure do |config|
  config.before do
    WebMock.disable_net_connect!(allow_localhost: true)
  end
end

# @return [String] Default project for api tests
def project
  'onlyoffice-testing-robot/testing-api.onlyoffice.com'
end
