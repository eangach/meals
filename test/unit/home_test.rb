require_relative 'test_helper'

describe 'view home' do

  it 'redirects to recipes page' do
    get '/'
    last_response.redirection?.must_equal true
    last_response.location.must_include '/recipes'
  end
end
