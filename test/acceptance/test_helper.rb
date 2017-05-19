require_relative '../test_helper'

require 'minitest/capybara'
require 'database_cleaner'

include Minitest::Capybara::Behaviour

Capybara.app = Meals

DatabaseCleaner.strategy = :truncation

require_relative'test_helper_capybara_fix.rb'
