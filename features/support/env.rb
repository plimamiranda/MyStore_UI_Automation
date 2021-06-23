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
require 'yaml'

include RSpec::Matchers

#Setup data config
module KnowsAboutConfig
    def load_yaml_file
        YAML.load_file(File.dirname(__FILE__) + "/../../config/config.yaml")
    end

    def base_url
        @_config ||= load_yaml_file
        @_config['website']['base_url']
    end
    def email
        @_email ||= load_yaml_file
        @_email['website']['credentials']['email']
    end
    def password
        @_password ||= load_yaml_file
        @_password['website']['credentials']['password']
    end
end

include KnowsAboutConfig

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
Capybara.app_host = base_url
# Capybara.default_driver = :selenium