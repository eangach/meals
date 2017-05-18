require_relative 'test_helper'

describe 'view recipes' do

  it 'successfully loads' do
    get '/recipes'
    last_response.ok?.must_equal true
  end
end
