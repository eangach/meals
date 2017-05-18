require 'sinatra/base'

class Meals < Sinatra::Base

  get '/recipes' do
    '<html/>'
  end

  run! if __FILE__ == $PROGRAM_NAME
end
