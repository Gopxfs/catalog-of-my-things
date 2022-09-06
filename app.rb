require 'date'
require './book'
require './label'
require './author'
require_relative './genre/genre'
require './game'

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

  def author_display
    if @authors.empty?
      puts "There isn't any author in our catalog."
      sleep(1)
    else
      @authors.each_with_index do |element, idx|
        line = "#{idx + 1}) Author: #{element.first_name} #{element.last_name}"
        puts line
      end
      sleep(2)
    end
  end

  def sending_message
    8.times do |i|
      print "Sending.#{'.' * (i % 3)}  \r"
      $stdout.flush
      sleep(0.5)
    end
  end

  def game_display
    if @games.empty?
      puts "There isn't any game in our catalog"
    else
      @games.each_with_index do |game, idx|
        line = "#{idx + 1}) Title: #{game.label.title} Multiplayer: #{game.multiplayer} Last date played: #{game.last_played_at} ID: #{game.id}\n" # rubocop:disable Layout/LineLength
        print line
      end
      sleep(2)
    end
  end

  def book_create
    title, author, genre, publisher, publish_date, cover_state, label_color = book_create_options

    book = Book.new(publish_date, publisher, cover_state)
    label = Label.new(title, label_color)
    author = Author.new(1, author, '')
    genre = Genre.new(genre)

    add_elements(book, label, author, genre)
    store_elements(label, author, genre)
    @books.push(book)

    puts 'Book created successfully!'
    sleep(1)
  end

  def book_create_options
    title = give_option('Title: ')
    author = give_option('Author: ')
    genre = give_option('Genre: ')
    publisher = give_option('Publisher: ')
    publish_date = give_option('Publish date (DD/MM/YYYY): ')
    cover_state = give_option('Cover state: ')
    label_color = give_option('Label color: ')
    [title, author, genre, publisher, publish_date, cover_state, label_color]
  end

  def game_create
    title, author_first_name, author_last_name, genre, publish_date, last_played_at, multiplayer, _cover_state, label_color = game_create_options # rubocop:disable Layout/LineLength

    game = Game.new(publish_date, multiplayer, last_played_at)
    label = Label.new(title, label_color)
    author = Author.new(1, author_first_name, author_last_name)
    genre = Genre.new(genre)

    add_elements(game, label, author, genre)
    store_elements(label, author, genre)
    @games.push(game)

    sending_message
    print 'Game created successfully!'
  end

  def game_create_options
    title = give_option('Title: ')
    author_first_name = give_option('Author - First name: ')
    author_last_name = give_option('Author - Last name: ')
    genre = give_option('Genre: ')
    publish_date = give_option('Publish date (DD/MM/YYYY): ')
    last_played_at = give_option('Last date played (DD/MM/YYYY): ')
    multiplayer = give_option('Multiplayer: ')
    cover_state = give_option('Cover state: ')
    label_color = give_option('Label color: ')
    [title, author_first_name, author_last_name, genre, publish_date, last_played_at, multiplayer, cover_state,
     label_color]
  end

  def give_option(option)
    print option.to_s

    case option
    when 'Publish date (DD/MM/YYYY): '
      date = gets.chomp

      return date if check_date(date)

      puts 'Please insert a valid date.'
      sleep(1)
      return give_option('Publish date (DD/MM/YYYY): ')

    when 'Last date played (DD/MM/YYYY): '
      date = gets.chomp
      return date if check_date(date)

      puts 'Please insert a valid date.'
      sleep(1)
      return give_option('Last date played (DD/MM/YYYY): ')
    end

    gets.chomp
  end

  def check_date(date)
    if date[2] && date[5] == '/'
      d, m, y = date.split('/')
      return Date.valid_date?(y.to_i, d.to_i, m.to_i)
    end
    false
  end

  def add_elements(item, label, author, genre)
    label.add_item(item)
    author.add_item(item)
    genre.add_item(item)
  end

  def store_elements(label, author, genre)
    @labels.push(label)
    @authors.push(author)
    @genres.push(genre)
  end

  def label_display
    if @labels.empty?
      puts "There aren't any labels."
      return sleep(1)
    end
    @labels.each do |label|
      puts "[#{label.id}] #{label.title} #{label.color}"
    end
    sleep(2)
  end
end
