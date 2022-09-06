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

  def book_display
    if @books.empty?
     puts "There isn't any book in our catalog."
     sleep(1)
    else
      @books.each do |book|
        puts "[#{book.id}] '#{book.label.title}' by #{book.author.first_name} #{book.author.last_name}"
      end
    end
  end
end
