source 'https://rubygems.org'
ruby '2.2.4'

gem 'rails', '3.2.22'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

# For ubuntu you probably should de the next before gem instalation:
# sudo apt-get install libpq-dev
gem 'pg'

gem 'cancan'

gem 'ancestry'

gem 'bcrypt-ruby', require: 'bcrypt'

gem 'recaptcha', require: 'recaptcha/rails'
# Gems used only for assets and not required
# in production environments by default.
gem 'jquery-rails'
gem 'jquery-ui-rails'

gem 'thin' 
gem 'nested_form'
gem 'railties'
gem 'simplecov'

gem 'safe_attributes'

gem 'recurring_select',   '>= 1.1.0'

gem 'ice_cube'

gem 'will_paginate', '>= 3.0.5'

gem 'devise'
gem 'devise_invitable'
gem 'strong_parameters'

gem 'paint'
gem 'awesome_print'
gem 'bootstrap-multiselect-rails'
gem 'twitter-bootstrap-rails'
gem 'less-rails'

gem 'rails-backbone'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', platforms: :ruby

  gem 'uglifier', '>= 1.0.3'
end

group :development, :test do
  gem 'minitest'
  gem 'test-unit', '>= 3.0'
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'guard-rspec'
  gem 'rspec-rails'
  gem 'rspec-activemodel-mocks'
  gem 'rspec-collection_matchers'
  gem 'watchr'
  gem 'shoulda-matchers'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'jasmine'

  gem 'metric_fu'
  gem 'rubycritic', require: false
  gem 'debride', require: false
  gem 'addressable', '~>2.3.0'

  gem 'pronto', '~> 0.5.0'
  gem 'pronto-rubocop', require: false
  gem 'pronto-flay', require: false
  #gem 'pronto-brakeman'
  gem 'pronto-poper'
  gem 'pronto-rails_best_practices'
  gem 'pronto-rails_schema'
  #gem 'pronto-reek'
  gem 'ci_reporter'
  gem 'ci_reporter_rspec'
#  gem 'spork', github: 'sporkrb/spork'
#  gem 'spork-rails'
  gem 'spring' 
end

group :production do
  gem 'rails_12factor'
  gem 'unicorn'
  gem 'unicorn-rails'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
