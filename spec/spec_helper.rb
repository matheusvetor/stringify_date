ENV["RAILS_ENV"] = 'test'

require File.expand_path("../../spec/dummy/config/environment", __FILE__)

require 'rspec/rails'

require 'stringify_date'
