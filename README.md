# ActivePortal

[![Build Status](https://travis-ci.org/nyjt/activeportal.svg?branch=master)](https://travis-ci.org/nyjt/activeportal)

## What's this?

ActivePortal is a gem for Ruby on Rails 4 applications. It contains a group of gem that need for a modern portal.
Every gem is optimised for a content heavy website with more thousand users.

### Features

+ User authentication and registration with confirmation (devise)
+ I18n and language detection (devise-i18n, devise-i18n-bootstrap, http\_accept\_language)

## Documentation

### Install

__1.__ Put your Gemfile the following line:

```ruby
gem 'activeportal', github: 'nyjt/activeportal'
```

__2.__ Execute bundle:

```bash
bundle install
```

__3.__ Mount the active_portal Rails engine. Put the following line into ```config/routes.rb```:

```ruby
mount ActivePortal::Engine => '/custom_name'
```

You can change custom_name prefix as you would like. Another option to mount the engine to '/' like here:

```ruby
mount ActivePortal::Engine => '/'

# and here come the other routes
```

__4.__ Create your customised user model to ```app/models/active_portal/user.rb``` with the following content:

```ruby
module ActivePortal
  class User < ActiveRecord::Base
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable, :confirmable,
           :recoverable, :rememberable, :trackable, :validatable
  end
end
```

Of course you can add or remove modules to change capaiblities of Devise.

__5.__ Change the first line on ```app/controllers/application_controller.rb```:

```ruby
class ApplicationController < ActivePortal::ApplicationController
```

Your ```ApplicationController``` should inherit from ```ActivePortal::ApplicationController```.

__6.__ Make sure you have added root path to your routes:

```ruby
root 'pages#home'
```

### Configuration

+ Copy https://raw.github.com/plataformatec/devise/master/lib/generators/templates/devise.rb into ```config/initializers/devise.rb``` and edit it.
+ Make sure you added this line to ```config/environments/production.rb```:

```ruby
config.action_mailer.default_url_options = { host: 'myhost.example.com', port: 3000 }
```

## License

This project rocks and uses MIT-LICENSE.

+ http://www.opensource.org/licenses/MIT
