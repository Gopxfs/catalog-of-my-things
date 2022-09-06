require './item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(id, publish_date, multiplayer, last_played_at, archived: false)
    super(publish_date, id, archived: archived)
    @multiplayer = multiplayer
    @last_played_at = Date.parse(last_played_at) # last_played_at should be a string = 'DD-MM-YYYY' or 'DD/MM/YYYY'
  end

  private

  def can_be_archived?
    return true if super && DateTime.now.year - @last_played_at.year > 2

    false
  end
end
