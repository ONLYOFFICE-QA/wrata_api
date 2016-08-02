# gem-wrata-api

Library for access API of [WRATA service] (https://github.com/ONLYOFFICE/testing-wrata) (project is private and WIP)
Used in QA team of ONLYOFFICE

## Installation

Add this line to your application's Gemfile:

    gem 'wrata_api'

And then execute:

    bundle

Or install it yourself as:

    gem install wrata_api

## Usage

Create yml file located in `~/.gem-wrata/config.yaml`
With content:
```
cookie: wrata_cookie
csrf_token: your_token
uri: http://0.0.0.0:3000
wrata_session: session_key
```

And use it like this:
```
require 'wrata_api'
WrataApi::WrataApi.new.servers
```