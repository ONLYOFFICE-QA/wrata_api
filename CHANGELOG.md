# Change log

## master (unreleased)

## 1.0.0 (2022-01-28)

### New Features

* Add `dependabot` config

### Fixes

* Fix compatibility with Rail v5.2 `use_authenticated_cookie_encryption`

### Changes

* Store frozen dependencies version in `Gemfile.lock`
* Drop support of Ruby 2.4 since it's EOLed

## 0.2.0 (2020-09-02)

### New Features

* Add method to get info about current profile

### Changes

* Fix new warnings from `rubocop` v0.89.0 update

## 0.1.2 (2020-06-17)

### New Features

* Support of services with https
* Add `markdown`, `rubocop` and `yard` coverage
  test via GitHub Actions
* Add support of `rubocop-rake`
* `yard` as development dependency

### Changes

* Freeze specific version of all `rubocop` extension
  as development dependencies
* `overcommit` now is not required as development dependency
* Add missing documentation

## 0.1.1 (2020-05-26)

### New Features

* Add config to `markdownlint`

### Fixes

* Fix pushing gem to github

## 0.1.0 (2020-05-26)

### New Features

* Ability to `power_on` servers with different size
* Change required version of ruby to 2.3
* Ability to get file list in project
* Support of `rubocop-performance`
* Update rubocop configs to `0.84.0`
* Add `WrataApi#add_to_queue` default value for `browser`
* Add support of `codecov` and `simplecov`
* Add `Rakefile` with default `spec` task
* Increase code coverage
* Add rake task to release gem on github and rubygems

### Fixes

* Raise error (not show strange error) while trying to create a lot of server
* Fix setting default value for `spec_browser`

### Changes

* Require ruby version >= 2.4
* Remove usage of `cleanup_test_path` while adding tests to queue
* `WrataApi#tests_in_queue` return all test data, not just name
* Cleanup `gemspec` file
