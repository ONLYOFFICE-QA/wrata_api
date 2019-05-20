# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('lib', __dir__)
require 'wrata_api/version'
Gem::Specification.new do |s|
  s.name = 'wrata_api'
  s.version = WrataApi::Version::STRING
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 1.9'
  s.authors = ['ONLYOFFICE', 'Pavel Lobashov']
  s.summary = 'Wrata API Gem'
  s.description = 'Wrapper around wrata API'
  s.email = ['shockwavenn@gmail.com']
  s.files = `git ls-files lib LICENSE.txt README.md`.split($RS)
  s.homepage = 'http://rubygems.org/gems/wrata_api'
  s.license = 'AGPL-3.0'
end
