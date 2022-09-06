require './item'
require 'json'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publish_date, publisher, cover_state, id = Random.rand(1..10_000))
    super(publish_date, id)
    @publisher = publisher
    @cover_state = cover_state
    @archived = false
  end

  private

  def can_be_archived?
    return true if super || cover_state == 'bad'

    false
  end
  
  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'properties' => [publish_date, publisher, cover_state, id, archived]
    }.to_json(*args)
  end

  def self.json_create(object)
    new(*object['properties'])
  end
end
