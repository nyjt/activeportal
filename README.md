# ActivePortal

## What's this?

ActivePortal is a gem for Ruby on Rails 4 applications. It contains a group of gem that need for a modern portal.
Every gem is optimised for a content heavy website with more thousand users.

### Features

+ User authentication and registration with confirmation (devise)
+ I18n and language detection (devise-i18n, devise-i18n-views, http\_accept\_language)

## Documentation

### Install

Put your Gemfile:

```ruby
gem 'activeportal', github: 'nyjt/activeportal'
```

### Configuration

+ Copy https://raw.github.com/plataformatec/devise/master/lib/generators/templates/devise.rb into ```config/initializers/devise.rb``` and edit it.
+ Make sure you set you put this line in ```config/environments/production.rb```:
  ```ruby
  config.action_mailer.default_url_options = { host: 'myhostname.example.com', port: 3000 }
  ```

## License

This project rocks and uses MIT-LICENSE.

+ http://www.opensource.org/licenses/MIT
