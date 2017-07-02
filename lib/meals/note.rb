require 'data_mapper'

class Note
  include DataMapper::Resource

  property :id, Serial
  property :text, Text

  belongs_to :recipe
end

# DataMapper.finalize
