require_relative 'test_helper'

describe 'Acceptance Tests' do
  describe 'View recipe' do
    before do
      DatabaseCleaner.clean
      Recipe.create title: 'Sample recipe 1'
    end

    let(:id) { Recipe.first(title: 'Sample recipe 1').id }

    it 'has a recipes page' do
      visit "/recipes/#{id}"
      page.body.must_include('Sample recipe 1')
    end
  end
end

