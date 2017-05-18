require_relative '../test_helper'

require 'rack/test'

include Rack::Test::Methods

def app
  Meals
end
