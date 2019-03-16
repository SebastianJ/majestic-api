require 'vcr'
require 'webmock/rspec'

VCR.configure do |c|
  c.allow_http_connections_when_no_cassette = false
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.hook_into :webmock # or :fakeweb
  c.configure_rspec_metadata!
  
  c.filter_sensitive_data('API_KEY') do |interaction|
    Majestic::Api.configuration.api_key
  end
  
  c.before_record do |i|
    i.response.body.force_encoding('UTF-8')
  end
  
end
