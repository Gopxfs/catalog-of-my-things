require_relative '../genre/genre'

describe 'Unit Tests for Genre Class' do
  before :each do
    @genre = Genre.new('Genre')
  end

  context 'initialize object' do
    it 'should be an instance of Genre' do
      expect(@genre).to be_instance_of Genre
    end
  end

  context 'methods' do
    it 'should respond to add_item' do
      expect(@genre).to respond_to(:add_item)
    end

    it 'should respond to name' do
      expect(@genre).to respond_to(:name)
    end

    it 'should respond to items' do
      expect(@genre).to respond_to(:items)
    end
  end

  context 'method add_item' do
    it 'should add an item to the genre' do
      item = Item.new('30/11/1982')
      @genre.add_item(item)
      expect(@genre.items).to include(item)
    end
  end
end
