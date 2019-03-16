RSpec.configure do |config|
  config.before(:each) do
    # The famous singleton problem
    Majestic::Api.configure do |config|
      config.api_key    =   nil
    end
  end
end

require "yaml"

def setup_client
  cfg_path                =   File.join(File.dirname(__FILE__), "../../credentials.yml")
  
  if ::File.exists?(cfg_path)
    cfg                   =   YAML.load_file(cfg_path)&.fetch("test")

    Majestic::Api.configure do |config|
      config.environment  =   cfg.fetch("environment", :sandbox)
      config.api_key      =   cfg.fetch("api_key", nil)
      config.verbose      =   false
    end
  else
    raise "Missing credentials.yml file - you need to create one and include your api key in order to run the specs."
  end
end
