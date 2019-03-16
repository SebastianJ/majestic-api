require "generator_spec"

require "generators/majestic/api/install_generator"

RSpec.describe ::Majestic::Api::Generators::InstallGenerator, type: :generator do
  root_dir = File.expand_path("../../../tmp/rails_app", __FILE__)
  
  destination root_dir
  arguments %w(Majestic)

  before :all do
    prepare_destination
    run_generator
  end
  
  it "creates a configuration initializer" do
    assert_file "config/initializers/majestic_api.rb", /Majestic::Api.configure do/i
  end
  
end
