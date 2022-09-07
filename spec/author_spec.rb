require_relative './spec_helper'

describe Author do
  before :each do
    @author = Author.new(1, 'julio', 'gagliardi')
  end

  describe '#new' do
    it 'receives 2 parameters and returns a Author object' do
      expect(@author).to be_an_instance_of Author
    end
  end

  describe '#add_item' do
    item = Item.new('05/09/2022')
    it 'adds an item to the items collection' do
      @author.add_item(item)
      expect(@author.items[0]).to eql item
    end
    it 'adds self as a property of the item object' do
      @author.add_item(item)
      expect(item.author).to eql @author
    end
  end
end
