require_relative '../genre/genre'

describe 'Unit Tests for Genre Class' do
  before :each do
    @genre = Genre.new('Genre', '01/01/2022')
  end

  context 'initialize object' do
    it 'should be an instance of Genre' do
      expect(@genre).to be_instance_of Genre
    end

    it 'should not be an instance of Item' do
      expect(@genre).not_to be_instance_of Item
    end

    it 'should be a kind of Item' do
      expect(@genre).to be_kind_of Item
    end
  end

  context 'methods' do
    it 'should respond to add_item' do
      expect(@genre).to respond_to(:add_item)
    end

    it 'should respond to name' do
      expect(@genre).to respond_to(:name)
    end

    it 'should respond to publish_date' do
      expect(@genre).to respond_to(:publish_date)
    end

    it 'should respond to items' do
      expect(@genre).to respond_to(:items)
    end
  end

  context 'method add_item' do
    it 'should add an item to the genre' do
      item = Item.new('Item')
      @genre.add_item(item)
      expect(@genre.items).to include(item)
    end
  end
end
