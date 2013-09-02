ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'pagemodels'

Dir[File.join(File.dirname(__FILE__), "/support/**/*.rb")].each { |f| require f }

PageModels.configure do |config|
  config.driver = :capybara
  config.integrate :rspec
  config.integrate :rails
end