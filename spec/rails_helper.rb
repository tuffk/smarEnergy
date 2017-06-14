ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'capybara/rspec'
require 'capybara/rails'
require 'capybara/poltergeist'
require 'factory_girl_rails'

# require 'devise'
Dir[Rails.root.join('spec', 'support', '**', '*.rb')].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  Capybara.javascript_driver = :poltergeist
  # config.include Warden::Test::Helpers
  config.include Capybara::DSL
  config.include Rails.application.routes.url_helpers
  # config.include TestingSupport::CapybaraHelper

  # routing
  Rails.application.routes.default_url_options[:only_path] = true

  config.include FactoryGirl::Syntax::Methods
  config.include ActiveJob::TestHelper
  config.include Helpers
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

  config.before(:suite) do
    # Clean database
    DatabaseCleaner.clean_with(:truncation, except: %w[ar_internal_metadata])

    # Use faster transaction strategy
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each) do
    # Track transactions
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.after(:suite) do
    DatabaseCleaner.clean
  end
end
