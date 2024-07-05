# frozen_string_literal: true

require 'simplecov'
SimpleCov.start

if ENV['CI']
  require 'simplecov-cobertura'
  SimpleCov.formatter = SimpleCov::Formatter::CoberturaFormatter
end

require 'wrata_api'

# @return [String] Default project for api tests
def project
  'onlyoffice-testing-robot/testing-api.onlyoffice.com'
end
