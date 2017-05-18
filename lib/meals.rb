require 'sinatra/base'

class Meals < Sinatra::Base

  get '/recipes' do
    @recipes =  [ 'Sample recipe 1', 'Sample recipe 2' ]

    haml :recipes, locals: { recipes: @recipes }
  end

  run! if __FILE__ == $PROGRAM_NAME
end
