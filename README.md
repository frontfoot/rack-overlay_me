# Rack::OverlayMe

Adds Overlay Me (https://github.com/frontfoot/overlay_me) to your Rack/Rails app.

## Installation

Add this line to your application's Gemfile:

    gem 'rack-overlay_me', group: 'development'

And then execute:

    $ bundle


## Usage

In a rack app

```ruby
use Rack::OverlayMe::Middleware
```

In a rails app

```ruby
#config/envionments/development.rb

config.middleware.use "Rack::OverlayMe::Middleware"
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
