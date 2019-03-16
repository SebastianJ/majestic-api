module Majestic
  module Api
    class Configuration
      attr_accessor :environment, :api_key, :verbose, :user_agent
    
      def initialize
        self.environment  =   :sandbox
        self.api_key      =   nil
        self.verbose      =   false
        self.user_agent   =   "Ruby Majestic API Client v#{Majestic::Api::VERSION}"
      end
    
    end
  end
end
