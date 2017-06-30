require_relative 'test_helper'

describe 'Acceptance Tests' do
  describe 'View recipe' do
    before do
      DatabaseCleaner.clean
      Recipe.create title: 'Sample recipe 1'
    end

    let(:recipe) { Recipe.first(title: 'Sample recipe 1') }

    it 'has the title' do
      visit "/recipes/#{recipe.id}"
      page.body.must_include('Sample recipe 1')
    end

    it 'has the summary' do
      recipe.summary = 'A recipe summary'
      recipe.save

      visit "/recipes/#{recipe.id}"
      page.body.text.must_include('A recipe summary')
    end

    it 'has the image' do
      recipe.image_uri = 'An image uri'
      recipe.save

      visit "/recipes/#{recipe.id}"
      page.body.text.must_include('')

      page.must_have_selector('img[src="An image uri"]')
    end

    it 'has the source' do
      recipe.source = 'The recipe source'
      recipe.save

      visit "/recipes/#{recipe.id}"
      page.body.text.must_include('Source: The recipe source')
    end

    it 'has the servings' do
      recipe.servings = '4'
      recipe.save

      visit "/recipes/#{recipe.id}"
      page.body.text.must_include('Servings: 4')
    end

    it 'has the yield' do
      recipe.yields = '4 servings'
      recipe.save

      visit "/recipes/#{recipe.id}"
      page.body.text.must_include('Yields: 4 servings')
    end

    it 'has the preparation time' do
      recipe.prep_time = '10 minutes'
      recipe.save

      visit "/recipes/#{recipe.id}"
      page.body.text.must_include('Prep Time: 10 minutes')
    end

    it 'has the total cooking time' do
      recipe.cook_time = '30 minutes'
      recipe.save

      visit "/recipes/#{recipe.id}"
      page.body.text.must_include('Cook Time: 30 minutes')
    end

    it 'has the total time' do
      recipe.total_time = '1 hour'
      recipe.save

      visit "/recipes/#{recipe.id}"
      page.body.text.must_include('Time: 1 hour')
    end

    it 'has the directions' do
      recipe.directions.create( text: 'Heat skillet.')
      recipe.save

      visit "/recipes/#{recipe.id}"
      page.body.text.must_include('Directions')
      page.body.text.must_include('Heat skillet.')
    end
  end
end
