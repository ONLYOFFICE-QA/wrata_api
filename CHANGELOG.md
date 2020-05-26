# Change log

## master (unreleased)

### New Features

* Ability to `power_on` servers with different size
* Change required version of ruby to 2.3
* Ability to get file list in project
* Support of `rubocop-performance`
* Update rubocop configs to `0.84.0`
* Add `WrataApi#add_to_queue` default value for `browser`
* Add support of `codecov` and `simplecov`
* Add `Rakefile` with default `spec` task

### Fixes

* Raise error (not show strange error) while trying to create a lot of server
* Fix setting default value for `spec_browser`

### Changes

* Require ruby version >= 2.4
* Remove usage of `cleanup_test_path` while adding tests to queue
* `WrataApi#tests_in_queue` return all test data, not just name
