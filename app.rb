require 'date'
require './book'
require './label'
require './author'
require_relative './genre/genre'
require './game'
require 'json'
require_relative './music/music_methodes'
require_relative './file_helper'

class App
  attr_accessor :books, :music_list, :games, :authors, :labels, :genres

  def initialize
    @books = []
    @music_list = []
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
        line = "#{idx + 1}) Title: #{game.label.title} #{game.author.first_name} Last date played: #{game.last_played_at} ID: #{game.id}\n" # rubocop:disable Layout/LineLength
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

    label.add_item(book)
    author.add_item(book)
    genre.add_item(book)

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
    title, author, _genre, publish_date, last_played_at, multiplayer, _cover_state, label_color = game_create_options

    game = Game.new(publish_date, multiplayer, last_played_at)
    label = Label.new(title, label_color)
    author = Author.new(1, author, '')

    label.add_item(game)
    author.add_item(game)

    @games.push(game)
    sending_message
    print 'Game created successfully!'
  end

  def game_create_options
    title = give_option('Title: ')
    author = give_option('Author: ')
    genre = give_option('Genre: ')
    publish_date = give_option('Publish date (DD/MM/YYYY): ')
    last_played_at = give_option('Last date played (DD/MM/YYYY): ')
    multiplayer = give_option('Multiplayer: ')
    cover_state = give_option('Cover state: ')
    label_color = give_option('Label color: ')
    [title, author, genre, publish_date, last_played_at, multiplayer, cover_state, label_color]
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
  def music_display
    puts ''
    puts '===============   Music List   ==============='
    puts ''
    list_music
  end

  def genre_display
    puts ''
    puts '===============   Genre List   ==============='
    puts ''
    list_labels
  end

  def music_create
    create_music
  end

  def genre_create
    create_genre
  end

  def save_files
    instance_variables.each do |var|
      file_name = var.to_s.chomp('_list').delete('@')
      ary = []
      instance_variable_get(var).each do |obj|
        hash = { ref: obj, value: to_hash(obj) }
        ary << hash
      end
      File.write("./data/#{file_name}.json", JSON.generate(ary))
    end
  end

  def read_files
    instance_variables.each do |var|
      file_name = var.to_s.chomp('_list').delete('@')
      if File.exist?("./data/#{file_name}.json") && File.read("./data/#{file_name}.json") != ''
        ary = JSON.parse(File.read("./data/#{file_name}.json"))
        case file_name
        when 'music'
          read_music(ary)
        when 'genre'
          read_genre(ary)
        end
      else
        File.write("./data/#{file_name}.json", '[]')
      end
    end
  end

  def to_hash(object)
    hash = {}
    object.instance_variables.each do |var|
      hash[var.to_s.delete('@')] = object.instance_variable_get(var)
    end
    hash
  end
end
