require_relative './item'

class Author
  attr_reader :id, :items
  attr_accessor :first_name, :last_name

  def initialize(id, first_name, last_name)
    @id = id || Random.rand(1...10_000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.add_author(self)
  end
end
