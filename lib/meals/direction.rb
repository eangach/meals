require 'data_mapper'

class Direction
  include DataMapper::Resource

  property :id, Serial
  property :text, Text

  belongs_to :recipe
end

# DataMapper.finalize
