require './item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publish_date, publisher, cover_state, id = Random.rand(1..10_000), archived: false)
    super(publish_date, id, archived: archived)
    @publisher = publisher
    @cover_state = cover_state
  end

  private

  def can_be_archived?
    return true if super || cover_state == 'bad'

    false
  end
end
