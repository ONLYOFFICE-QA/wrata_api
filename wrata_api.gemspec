# frozen_string_literal: true

require_relative 'lib/wrata_api/name'
require_relative 'lib/wrata_api/version'

Gem::Specification.new do |s|
  s.name = WrataApi::Name::STRING
  s.version = WrataApi::Version::STRING
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 3.0'
  s.authors = ['ONLYOFFICE', 'Pavel Lobashov']
  s.email = %w[shockwavenn@gmail.com]
  s.summary = 'Wrata API Gem'
  s.description = 'Wrapper around wrata API'
  s.homepage = "https://github.com/ONLYOFFICE/#{s.name}"
  s.metadata = {
    'bug_tracker_uri' => "#{s.homepage}/issues",
    'changelog_uri' => "#{s.homepage}/blob/master/CHANGELOG.md",
    'documentation_uri' => "https://www.rubydoc.info/gems/#{s.name}",
    'homepage_uri' => s.homepage,
    'source_code_uri' => s.homepage,
    'rubygems_mfa_required' => 'true'
  }
  s.files = Dir['lib/**/*']
  s.license = 'AGPL-3.0'
end
