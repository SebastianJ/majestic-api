# Majestic Ruby API Client #

Client intended to be used with [Majestic's API](http://developer-support.majesticseo.com/).

This gem is forked/rewritten based on [https://github.com/SebastianJ/Majestic-SEO-Api](https://github.com/SebastianJ/Majestic-SEO-Api).

Majestic dropped the "SEO" brand a long time ago and the previous client's name was out of sync with this change.

The client has also been slightly rewritten and prepared to be easier to maintain.

## Installation ##
```
gem install majestic-api
```

## Configuration ##
```
Majestic::Api.configure do |config|
  config.environment  =   :production # The environment to use, valid values: :sandbox, :production
  config.api_key      =   'api_key' # Your API key provided by Majestic
  config.verbose      =   false # Set to true to enable Faraday's logging middleware to get more information
end
```

If you're using Rails, create an initializer in config/initializers/majestic.rb to configure the client globally in your app.