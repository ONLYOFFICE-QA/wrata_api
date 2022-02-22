# frozen_string_literal: true

require_relative 'lib/wrata_api'
require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task default: :spec

desc 'Release gem'
task :release_github_rubygems do
  Rake::Task['release'].invoke
  sh('gem push --key github '\
     '--host https://rubygems.pkg.github.com/ONLYOFFICE-QA '\
     "pkg/#{WrataApi::Name::STRING}-"\
     "#{WrataApi::Version::STRING}.gem")
end
