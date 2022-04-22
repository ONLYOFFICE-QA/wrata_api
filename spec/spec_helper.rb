# frozen_string_literal: true

require 'simplecov'
SimpleCov.start

if ENV['CI']
  require 'codecov'
  SimpleCov.formatter = SimpleCov::Formatter::Codecov
end

require 'wrata_api'

# @return [String] Default project for api tests
def project
  'onlyoffice-testing-robot/testing-api.onlyoffice.com'
end
