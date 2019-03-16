# frozen_string_literal: true

require "rails/generators/base"

module Majestic
  module Api
    module Generators
      class InstallGenerator < Rails::Generators::NamedBase
        include Rails::Generators::ResourceHelpers
        
        source_root File.expand_path('templates', __dir__)

        desc "Creates an initializer for Majestic::Api for your Rails application."
        
        def copy_initializer_file
          copy_file "config.rb", "config/initializers/majestic_api.rb"
        end
      
      end
    end
  end
end
