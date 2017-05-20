require_relative 'test_helper'

describe 'Acceptance Tests' do
  describe 'Recipe' do
    before do
      DatabaseCleaner.clean
      Recipe.create title: 'Sample recipe 1'
    end

    it 'has a recipes page' do
      visit '/recipes'
      page.must_have_link('Sample recipe 1')
      page.must_have_link('Sample recipe 2')
    end
  end
end

