require 'rubygems'
require 'chronic'

ENV['RAILS_ENV'] ||= 'test'
RAILS_ENV ||= 'test'
require 'cucumber/rails'
require 'rspec/expectations'

require Rails.root.join('spec/support/capybara')

World(RSpec::Mocks::ExampleMethods)
Cucumber::Rails::Database.autorun_database_cleaner = true
# Cucumber::Rails::World.use_transactional_fixtures = false
