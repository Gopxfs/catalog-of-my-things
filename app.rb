require 'date'
require './label'
require './author'
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
        line = "#{idx + 1}) Title: #{game.label.title} #{game.author.first_name} Last date played: #{game.last_played_at} ID: #{game.id}\n"
        print line
      end
      sleep(2)
    end
  end

  def game_create
    title, author, genre, publish_date, last_played_at, multiplayer, cover_state, label_color = game_create_options

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

    if option == 'Publish date (DD/MM/YYYY): '
      date = gets.chomp

      return date if check_date(date)

      puts 'Please insert a valid date.'
      sleep(1)
      return give_option('Publish date (DD/MM/YYYY): ')
    elsif option == 'Last date played (DD/MM/YYYY): '
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
end
