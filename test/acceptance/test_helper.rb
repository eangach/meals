require_relative '../test_helper'

require 'minitest/capybara'

include Minitest::Capybara::Behaviour

Capybara.app = Meals

require_relative'test_helper_capybara_fix.rb'
