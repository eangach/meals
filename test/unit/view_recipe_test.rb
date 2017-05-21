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

    let(:recipe) { Recipe.first(title: 'Sample recipe 1') }

    it 'successfully loads' do
      get "/recipes/#{recipe.id}"
      last_response.ok?.must_equal true
    end

    it 'can have a summary' do
      recipe.summary = 'A recipe summary'
      recipe.save

      get "/recipes/#{recipe.id}"
      html = last_response.body
      page = Nokogiri::HTML(html)
      summary =  page.css('.recipe .summary')

      summary.text.strip.must_equal 'A recipe summary'
    end

    it 'has the summary as optional' do
      recipe.summary.must_be_nil

      get "/recipes/#{recipe.id}"
      html = last_response.body
      page = Nokogiri::HTML(html)
      summary =  page.css('.recipe .summary')

      summary.must_be_empty
    end

    it 'can have an image' do
      recipe.image_uri = 'An image uri'
      recipe.save

      get "/recipes/#{recipe.id}"
      html = last_response.body
      page = Nokogiri::HTML(html)
      image =  page.css('.recipe .image img')
      image.attr('src').value.must_equal 'An image uri'
    end

    it 'has the image as optional' do
      recipe.image_uri.must_be_nil

      get "/recipes/#{recipe.id}"
      html = last_response.body
      page = Nokogiri::HTML(html)
      image =  page.css('.recipe .image')
      image.must_be_empty
    end

    it 'can have a source' do
      recipe.source = 'The recipe source'
      recipe.save

      get "/recipes/#{recipe.id}"
      html = last_response.body
      page = Nokogiri::HTML(html)
      source =  page.css('.recipe .source')

      source.text.strip.gsub(/\s\s+/, ' ').must_equal 'Source: The recipe source'
    end

    it 'has the source as optional' do
      recipe.source.must_be_nil

      get "/recipes/#{recipe.id}"
      html = last_response.body
      page = Nokogiri::HTML(html)
      source =  page.css('.recipe .source')

      source.must_be_empty
    end

    it 'can have the number of servings' do
      recipe.servings = '4'
      recipe.save

      get "/recipes/#{recipe.id}"
      html = last_response.body
      page = Nokogiri::HTML(html)
      servings =  page.css('.recipe .servings')

      servings.text.strip.gsub(/\s\s+/, ' ').must_equal 'Servings: 4'
    end

    it 'has the number of servings as optional' do
      recipe.servings.must_be_nil

      get "/recipes/#{recipe.id}"
      html = last_response.body
      page = Nokogiri::HTML(html)
      servings =  page.css('.recipe .servings')

      servings.must_be_empty
    end

    it 'can have the yield' do
      recipe.yields = '4 servings'
      recipe.save

      get "/recipes/#{recipe.id}"
      html = last_response.body
      page = Nokogiri::HTML(html)
      yields =  page.css('.recipe .yields')

      yields.text.strip.gsub(/\s\s+/, ' ').must_equal 'Yields: 4 servings'
    end

    it 'has the yield as optional' do
      recipe.yields.must_be_nil

      get "/recipes/#{recipe.id}"
      html = last_response.body
      page = Nokogiri::HTML(html)
      yields =  page.css('.recipe .yields')

      yields.must_be_empty
    end

    it 'can have a preparation time' do
      recipe.prep_time = '10 minutes'
      recipe.save

      get "/recipes/#{recipe.id}"
      html = last_response.body
      page = Nokogiri::HTML(html)
      prep_time =  page.css('.recipe .prep_time')

      prep_time.text.strip.gsub(/\s\s+/, ' ').must_equal 'Prep Time: 10 minutes'
    end

    it 'has the preparation time as optional' do
      recipe.prep_time.must_be_nil

      get "/recipes/#{recipe.id}"
      html = last_response.body
      page = Nokogiri::HTML(html)
      prep_time =  page.css('.recipe .prep_time')

      prep_time.must_be_empty
    end

    it 'can have a cooking time' do
      recipe.cook_time = '30 minutes'
      recipe.save

      get "/recipes/#{recipe.id}"
      html = last_response.body
      page = Nokogiri::HTML(html)
      cook_time =  page.css('.recipe .cook_time')

      cook_time.text.strip.gsub(/\s\s+/, ' ').must_equal 'Cook Time: 30 minutes'
    end

    it 'has the cooking time as optional' do
      recipe.cook_time.must_be_nil

      get "/recipes/#{recipe.id}"
      html = last_response.body
      page = Nokogiri::HTML(html)
      cook_time =  page.css('.recipe .cook_time')

      cook_time.must_be_empty
    end

    it 'can have an total time' do
      recipe.total_time = '1 hour'
      recipe.save

      get "/recipes/#{recipe.id}"
      html = last_response.body
      page = Nokogiri::HTML(html)
      total_time =  page.css('.recipe .total_time')

      total_time.text.strip.gsub(/\s\s+/, ' ').must_equal 'Time: 1 hour'
    end

    it 'has the total time as optional' do
      recipe.total_time.must_be_nil

      get "/recipes/#{recipe.id}"
      html = last_response.body
      page = Nokogiri::HTML(html)
      total_time =  page.css('.recipe .total_time')

      total_time.must_be_empty
    end
  end
end
