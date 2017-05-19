require 'data_mapper'

# DataMapper::Logger.new($stdout, :debug)

class Recipe
  include DataMapper::Resource
  property :id, Serial
  property :title, String
  property :added_on, Date
end

DataMapper.finalize
