# gem-wrata-api

Library for access API of [WRATA service](https://github.com/ONLYOFFICE/testing-wrata)
Used in QA team of ONLYOFFICE

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'wrata_api'
```

And then execute:

```shell script
bundle
```

Or install it yourself as:

```shell script
 gem install wrata_api
```

## Usage

Create yml file located in `~/.gem-wrata/config.yaml`
With content:

```yaml
cookie: wrata_cookie
csrf_token: your_token
uri: http://0.0.0.0:3000
wrata_session: session_key
```

And use it like this:

```ruby
require 'wrata_api'
WrataApi::WrataApi.new.servers
```

## License

gem-wrata_api is released under an GNU AGPL v3.0 license.
See the LICENSE file for more information.
