require 'date'
require './book'
require './label'
require './author'
# require './genre'

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
      sleep(2)
    end
  end

  def book_create
    title, author, genre, publisher, publish_date, cover_state, label_color = book_create_options

    book = Book.new(publish_date, publisher, cover_state)
    label = Label.new(title, label_color)
    author = Author.new(1, author, "")
    # genre = Genre.new(genre)

    label.add_item(book)
    author.add_item(book)
    # genre.add_item(book)
    
    @books.push(book)
    puts "Book created successfully!"
    return sleep(1)
  end

  def book_create_options
    title = give_option("Title: ")
    author = give_option("Author: ")
    genre = give_option("Genre: ")
    publisher = give_option("Publisher: ")
    publish_date = give_option("Publish date (DD/MM/YYYY): ")
    cover_state = give_option("Cover state: ")
    label_color = give_option("Label color: ")
    return title, author, genre, publisher, publish_date, cover_state, label_color
  end

  def give_option(option)
    print "#{option}"

    if option == "Publish date (DD/MM/YYYY): "
      date = gets.chomp
      if check_date(date)
        return date
      else
        puts "Please insert a valid date."
        sleep(1)
        return give_option("Publish date (DD/MM/YYYY): ")
      end
    end

    return gets.chomp
  end

  def check_date(date)
    if date[2] && date[5] == '/'
      d, m, y = date.split('/')
      return Date.valid_date?(y.to_i, d.to_i, m.to_i)
    end
    return false
  end
end
