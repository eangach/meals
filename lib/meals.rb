require 'sinatra/base'
require_relative 'meals/recipe'

class Meals < Sinatra::Base

  configure :development, :test do
    # DataMapper::Logger.new($stdout, :debug)
    DataMapper.setup(:default, 'sqlite::memory:')
    DataMapper.auto_migrate!
  end

  get '/recipes' do
    haml :recipes, locals: { recipes: ::Recipe.all }
  end

  run! if __FILE__ == $PROGRAM_NAME
end
