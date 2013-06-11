require 'selenium-webdriver'
require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'capybara-screenshot'
require 'yaml'
require 'writeexcel'

Capybara.run_server = false
Capybara.default_driver = :selenium
Capybara.default_wait_time = 60
Capybara.default_selector = :css
Capybara.current_driver = :selenium

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file }
require 'rspec/expectations'

# Check for win32 / 64 bit machine
# if RbConfig::CONFIG['host_os'] == "mswin32" || RbConfig::CONFIG['host_os'] == "mswin64"
#   begin
#     Selenium::WebDriver::Firefox.path = "C:/Program Files/Mozilla Firefox/firefox.exe"
#   rescue
#     Selenium::WebDriver::Firefox.path = "C:/Program Files (x86)/Mozilla Firefox/firefox.exe"
#   end
# # end

# Selenium::WebDriver::Chrome.path='/home/leszek/chromedriver'

# Set the Firefox browser
  Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :ff)
end
#URL

ENV_URL = ENV['TEST_ENV']
