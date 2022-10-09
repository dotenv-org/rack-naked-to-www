# Rack::Naked::To::Www

## Usage

Add to your Gemfile

```ruby
gem "rack-www-enforcer"
```

Add to `config/application.rb`

```ruby
module YourApp
  class Application < Rails::Application
    ..

    config.middleware.insert_before ActionDispatch::Static, Rack::NakedToWww

    ..
  end
end
```

## Development

```
bundle exec rspec
bundle exec standardrb --fix
```

## Credits

Inspiration [rack-www-enforcer](https://github.com/guilleiguaran/rack-www-enforcer)
