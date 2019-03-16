require 'faraday'
require 'faraday_middleware'

require 'majestic/api/version'

if !String.instance_methods(false).include?(:underscore)
  require 'majestic/api/extensions/string'
end

require 'majestic/api/configuration'

require 'majestic/api/logger'
require 'majestic/api/exceptions'

require 'majestic/api/response'
require 'majestic/api/item_info_response'
require 'majestic/api/item_info'
require 'majestic/api/client'

require 'majestic/api/railtie' if defined?(Rails)

module Majestic
  module Api
    class << self
      attr_writer :configuration
    end

    def self.configuration
      @configuration ||= ::Majestic::Api::Configuration.new
    end

    def self.reset
      @configuration = ::Majestic::Api::Configuration.new
    end

    def self.configure
      yield(configuration)
    end
  end
end
