# frozen_string_literal: true

require_relative 'lib/wrata_api/name'
require_relative 'lib/wrata_api/version'

Gem::Specification.new do |s|
  s.name = WrataApi::Name::STRING
  s.version = WrataApi::Version::STRING
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 2.4'
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
    'source_code_uri' => s.homepage
  }
  s.files = Dir['lib/**/*']
  s.license = 'AGPL-3.0'
  s.add_development_dependency('rake', '~> 13.0')
  s.add_development_dependency('rubocop', '0.89.1')
  s.add_development_dependency('rubocop-performance', '1.7.1')
  s.add_development_dependency('rubocop-rake', '0.5.1')
  s.add_development_dependency('rubocop-rspec', '1.43.1')
end
