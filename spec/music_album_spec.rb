require_relative '../music/music_album'

describe 'Unit Tests for MusicAlbum Class' do
  before :each do
    @album = MusicAlbum.new('30/11/1982', 'false')
  end

  context 'initialize object' do
    it 'should be an instance of MusicAlbum' do
      expect(@album).to be_instance_of MusicAlbum
    end

    it 'should not be an instance of Item' do
      expect(@album).not_to be_instance_of Item
    end

    it 'should be a kind of Item' do
      expect(@album).to be_kind_of Item
    end
  end

  context 'method can_be_archived?' do
    it 'should return true if on_spotify is true' do
      expect(@album.send(:can_be_archived?)).to be true
    end

    it 'should return true  even if on_spotify is false' do
      @album.on_spotify = false
      expect(@album.send(:can_be_archived?)).to be true
    end

    it 'should return false if on_spotify is false and publish_date is less than 10 years ago' do
      @album.on_spotify = false
      @album.publish_date = Date.parse('30/11/2020')
      expect(@album.send(:can_be_archived?)).to be false
    end
  end
end
