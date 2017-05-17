require_relative 'test_helper'

describe "my example app" do

  it 'has a recipes page' do
    visit '/recipes'
    page.must_have_content("Sample recipe 1")
    page.must_have_content("Sample recipe 2")
  end
end

