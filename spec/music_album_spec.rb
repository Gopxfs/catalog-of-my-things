require_relative '../music/music_album'

describe 'Unit Tests for MusicAlbum Class' do
  before :each do
    @album = MusicAlbum.new( '1982/11/30', 'yes')
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
end