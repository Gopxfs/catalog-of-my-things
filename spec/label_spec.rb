require_relative './spec_helper'

describe Label do
  before :each do
    @label = Label.new('title', 'color')
  end

  describe '#new' do
    it 'receives 3 parameters and returns a Label object' do
      expect(@label).to be_an_instance_of Label
    end
  end

  describe '#add_item' do
    item = Item.new(1, '05/09/2022')
    it 'adds an item to the items collection' do
      @label.add_item(item)
      expect(@label.items[0]).to eql item
    end
    it 'adds self as a property of the item object' do
      @label.add_item(item)
      expect(item.label).to eql @label
    end
  end
end
