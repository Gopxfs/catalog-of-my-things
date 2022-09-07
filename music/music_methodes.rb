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

def create_music # rubocop:disable Metrics/MethodLength
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
  genre_music = Genre.new(genre)
  label = Label.new(title, 'red')
  author_music = Author.new(Random.rand(0..10_000), author, '')

  label.add_item(music)
  author_music.add_item(music)
  genre_music.add_item(music)

  @music_list.push(music)
  @labels.push(label)
  @authors.push(author_music)
  @genres.push(genre_music)

  puts 'Music created successfully!'
end
