require 'date'
require_relative '../item'

class Genre < Item
    attr_accessor :name, :items
    attr_reader :id, :publish_date

    def initialize(name, publish_date)
        super(id = Random.rand(1..10_000))
        @name = name
        @publish_date = Date.parse(publish_date)
        @id = id
        @items = []
    end

    def add_item(item)
        (@items << item) unless @items.include?(item)
        item.add_genre(self)
    end
end