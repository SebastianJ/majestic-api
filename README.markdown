# Majestic Ruby API Client

Client intended to be used with [Majestic's API](http://developer-support.majesticseo.com/).

This gem is forked/rewritten based on [https://github.com/SebastianJ/Majestic-SEO-Api](https://github.com/SebastianJ/Majestic-SEO-Api).

Majestic dropped the "SEO" brand a long time ago and the previous client's name was out of sync with this change.

The client has also been slightly rewritten and has been prepared to be easier to maintain.

## Installation
```
gem install majestic-api
```

## Configuration
```
Majestic::Api.configure do |config|
  config.api_key      =   'api_key' # Your API key provided by Majestic
  config.environment  =   :production # The environment to use, valid values: :sandbox, :production
  config.verbose      =   false # Set to true to enable logging + Faraday's logging middleware to get more information
end
```

To generate an initializer execute the following command:

```ruby
rails g majestic:api:install Majestic
```

## Usage

```ruby
client    =   ::Majestic::Api::Client.new
data      =   client.get_index_item_info(urls: ["google.com", "yahoo.com"], params: {data_source: :historic})
data.items&.each { |item| puts "Historic Trust Flow for domain '#{item.url}' is: #{item.trust_flow}"}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies.

Copy credentials.yml.example to credentials.yml and enter your API key in that file.

Run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Testing

Please be aware that removing any of the VCR cassettes under spec/fixtures/vcr_cassettes and re-running the specs might lead to sensitive/personal data being stored in the newly generated cassettes!

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/SebastianJ/majestic-api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Adtraction::Api project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/SebastianJ/majestic-api/blob/master/CODE_OF_CONDUCT.md).
