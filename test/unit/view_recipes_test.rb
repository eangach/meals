require_relative 'test_helper'
require 'database_cleaner'
require 'nokogiri'

DatabaseCleaner.strategy = :truncation

describe 'view recipes' do
  before do
    DatabaseCleaner.clean
    Recipe.create title: 'Sample recipe 1'
    Recipe.create title: 'Sample recipe 2'
    Recipe.create title: 'Sample recipe 3'
  end

  it 'successfully loads' do
    get '/recipes'
    last_response.ok?.must_equal true
  end

  it 'shows the correct number of recipes' do
    get '/recipes'
    html = last_response.body
    page = Nokogiri::HTML(html)
    recipe_links =  page.css('.recipe_list a')

    recipe_links.count.must_equal 3
  end

  it 'shows all the recipes' do
    get '/recipes'
    html = last_response.body
    page = Nokogiri::HTML(html)
    recipe_links =  page.css('.recipe_list a')

    recipe_titles = recipe_links.map { |link| link.content.strip }
    recipe_titles.must_include 'Sample recipe 1'
    recipe_titles.must_include 'Sample recipe 2'
    recipe_titles.must_include 'Sample recipe 3'
  end
end
