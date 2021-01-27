#bootstrap
require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'rspec/expectations'
require 'capybara/rspec'
require 'capybara/rspec/matchers'
require 'faker'
require 'launchy'
require 'site_prism'

include RSpec::Matchers

#Site Prism
Capybara.register_driver :site_prism do |app|
    browser = ENV.fetch('browser', 'firefox').to_sym
    Capybara::Selenium::Driver.new(app, browser: browser)
end

# Telling Capybara to use the Driver defined above as it's default driver
Capybara.configure do |config|
    config.default_driver = :site_prism
end

Capybara.run_server = false
Capybara.app_host = 'http://automationpractice.com'
# Capybara.default_driver = :selenium