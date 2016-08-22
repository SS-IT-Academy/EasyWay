require 'phantomjs'
require 'capybara/rspec'
require 'capybara/rails'
require 'capybara/cucumber'
require 'capybara/poltergeist'
require 'capybara/session'

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(
    app,
    phantomjs: Phantomjs.path,
    js_errors: true,
    inspector: true,
    phantomjs_options: ['--load-images=no', '--ignore-ssl-errors=yes'],
    timeout: 120
  )
end

Capybara.default_driver = :poltergeist
Capybara.javascript_driver = :poltergeist
Capybara.app_host = 'http://localhost:3000'
Capybara.asset_host = 'http://localhost:3000'
Capybara.server_port = 3000
# Capybara.app = EventsPlatform::Application

# Capybara defaults to XPath selectors rather than Webrat's default of CSS3. In
# order to ease the transition to Capybara we set the default here. If you'd
# prefer to use XPath just remove this line and adjust any selectors in your
# steps to use the XPath syntax.
Capybara.default_selector = :css

# We have a ridiculously high wait time to account for build machines of various beefiness.
# Capybara.default_max_wait_time = 30

# If you set this to false, any error raised from within your app will bubble
# up to your step definition and out to cucumber unless you catch it somewhere
# on the way. You can make Rails rescue errors and render error pages on a
# per-scenario basis by tagging a scenario or feature with the @allow-rescue tag.
#
# If you set this to true, Rails will rescue all errors and render error
# pages, more or less in the same way your application would behave in the
# default production environment. It's not recommended to do this for all
# of your scenarios, as this makes it hard to discover errors in your application.
ActionController::Base.allow_rescue = false