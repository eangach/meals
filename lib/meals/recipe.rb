require 'data_mapper'
require_relative 'direction'

# DataMapper::Logger.new($stdout, :debug)

class Recipe
  include DataMapper::Resource
  property :id, Serial
  property :title, String
  property :summary, Text
  property :image_uri, Text
  property :source, Text
  property :servings, String
  property :yields, String
  property :prep_time, String
  property :cook_time, String
  property :total_time, String
  property :added_on, Date

  has n, :directions
end

DataMapper.finalize
