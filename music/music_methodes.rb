require_relative './music_album'
require_relative '../label'
require_relative '../genre/genre'
require_relative '../genre/genre_methods'
require_relative '../item'

def list_music
  @music_list.each_with_index do |music, index|
    puts "(#{index}) ID: #{music.id}, Publish Date: #{music.publish_date}, On Spotify: #{music.on_spotify}, Archived: #{music.archived}" # rubocop:disable Layout/LineLength
  end
end

def create_music
  puts 'Please enter the publish date (YYYY/MM/DD):'
  publish_date = gets.chomp
  puts 'Is it on Spotify? (true/false)'
  on_spotify = gets.chomp
  puts 'Title:'
  title = gets.chomp
  puts 'Genre:'
  genre = gets.chomp
  puts 'Author:'
  author = gets.chomp

  music = MusicAlbum.new(publish_date, on_spotify)
  genreMusic = Genre.new(genre)
  label = Label.new(title, 'red')
  puts  genreMusic.name
  puts  genreMusic.id
  authorMusic = Author.new(Random.rand(0..10_000) ,author, '')
  
  label.add_item(music)
  genreMusic.add_item(music)
  authorMusic.add_item(music)

  music_item = Item.new(publish_date, Random.rand(0..10_000))
  music_item.add_genre(genreMusic)
  music_item.add_author(authorMusic)
  music_item.add_label(label)

  @items << music_item

  @genres << genreMusic
  @music_list << music
  puts 'Music created successfully!'
  sleep(1)
end

def add_music(publish_date, on_spotify)
  music = MusicAlbum.new(publish_date, on_spotify)
  @music_list << music
end

def list_labels
  @music_list.each_with_index do |music, index|
    puts "(#{index}) ID: #{music.id}, Label: #{music.label}"
  end
end
