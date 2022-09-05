class App
  attr_accessor :books, :music_albums, :games, :authors, :labels, :genres

  def initialize
    @books = []
    @music_albums = []
    @games = []
    @authors = []
    @labels = []
    @genres = []
  end
end
