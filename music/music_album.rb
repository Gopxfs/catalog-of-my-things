require_relative '../item'
require_relative '../app'
require 'date'

class MusicAlbum < Item
  attr_accessor :on_spotify, :archived, :publish_date
  attr_reader :id, :genre, :author, :label

  def initialize(publish_date, on_spotify, id = Random.rand(1..10_000))
    super(publish_date, id)
    @publish_date = Date.parse(publish_date)
    @id = id
    @on_spotify = on_spotify == 'true'
    @archived = can_be_archived?
  end

  private

  def can_be_archived?
    super || @on_spotify ? true : false
  end
end
