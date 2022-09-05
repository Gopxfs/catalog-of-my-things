require_relative './item'

class Author < Item
  attr_reader :id, :items
  attr_accessor :first_name, :last_name

  def initialize(first_name, last_name)
    super()
    @first_name = first_name
    @last_name = last_name
    @id = id || Random.rand(1...10_000)
    @items = []
  end

  def add_item(item)
    item.add_author(self)
  end
end
