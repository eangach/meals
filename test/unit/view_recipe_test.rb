require_relative 'test_helper'
require 'database_cleaner'
require 'nokogiri'

DatabaseCleaner.strategy = :truncation

describe 'Unit Tests' do
  describe 'View recipe' do
    before do
      DatabaseCleaner.clean
      Recipe.create title: 'Sample recipe 1'
    end

    let(:id) { Recipe.first(title: 'Sample recipe 1').id }

    it 'successfully loads' do
      get "/recipes/#{id}"
      last_response.ok?.must_equal true
    end
  end
end
