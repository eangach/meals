require_relative 'test_helper'

describe Recipe do
  before do
    DatabaseCleaner.clean
    Recipe.create title: 'Sample recipe 1'
  end

  let(:recipe) { Recipe.first }

  it 'has a title' do
    recipe.title.must_equal 'Sample recipe 1'
  end

  it 'can have a summary' do
    recipe.summary.must_be_nil

    recipe.summary = 'A summary'
    recipe.summary.must_equal 'A summary'
  end

  it 'can have an image' do
    recipe.image.must_be_nil

    recipe.image = 'An image ref'
    recipe.image.must_equal 'An image ref'
  end

  it 'can have a source' do
    recipe.source.must_be_nil

    recipe.source = 'A source'
    recipe.source.must_equal 'A source'
  end

  it 'can have the number of servings' do
    recipe.servings.must_be_nil

    recipe.servings= '4'
    recipe.servings.must_equal '4'
  end

  it 'can have a yield' do
    recipe.yield.must_be_nil

    recipe.yield= '2 servings'
    recipe.yield.must_equal '2 servings'
  end

  it 'can have a preparation time' do
    recipe.prep_time.must_be_nil

    recipe.prep_time = '10 minutes'
    recipe.prep_time.must_equal '10 minutes'
  end

  it 'can have a cooking time' do
    recipe.cook_time.must_be_nil

    recipe.cook_time = '30 minutes'
    recipe.cook_time.must_equal '30 minutes'
  end

  it 'can have an overall time' do
    recipe.time.must_be_nil

    recipe.time = '1 hour'
    recipe.time.must_equal '1 hour'
  end
end
