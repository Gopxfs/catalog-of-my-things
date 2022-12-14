require 'date'
require_relative '../item'

class Genre
  attr_accessor :name, :items
  attr_reader :id

  def initialize(name, id = Random.rand(1..10_000))
    @name = name
    @id = id
    @items = []
  end

  def add_item(item)
    (@items << item) unless @items.include?(item)
    item.add_genre(self)
  end
end
