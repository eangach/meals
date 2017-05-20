require 'sinatra/base'
require_relative 'meals/recipe'

class Meals < Sinatra::Base

  configure :production do
    DataMapper.setup(:default, ENV['DATABASE_URL'])
  end

  configure :development, :test do
    # DataMapper::Logger.new($stdout, :debug)
    DataMapper.setup(:default, 'sqlite::memory:')
    DataMapper.auto_migrate!
  end

  get '/' do
    redirect '/recipes'
  end

  get '/recipes' do
    haml :recipes, locals: { recipes: ::Recipe.all }
  end

  get '/recipes/:id' do
    haml :recipe, locals: { recipe: ::Recipe.get(params['id']) }
  end

  run! if __FILE__ == $PROGRAM_NAME
end
