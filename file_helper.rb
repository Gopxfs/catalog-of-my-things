require_relative './music/music_methodes'

def read_music(array)
  array.each do |line|
    music_publish_date = line['value']['publish_date']
    music_on_spotify = line['value']['on_spotify']
    # ref_genre = line['ref']['genre']
    # puts "ID: #{music_id}, Publish Date: #{music_publish_date}, On Spotify: #{music_on_spotify}, Archived: #{music_archived}" # rubocop:disable Layout/LineLength
    add_music(music_publish_date, music_on_spotify)
  end
end

def read_genre(array)
  array.each do |line|
    genre_name = line['value']['name']
    # puts "ID: #{genre_id}, Name: #{genre_name}"
    add_genre(genre_name)
  end
end

def read_music_details(ary)
  ary.each do |line|
    music_id = line['value']['id']
    music_publish_date = line['value']['publish_date']
    music_on_spotify = line['value']['on_spotify']
    music_archived = line['value']['archived']
    music_genre = line['value']['genre']['value']['name']
    music_author = line['value']['author']['value']['name']
    music_label = line['value']['label']['value']['name']
    ref = line['ref']
    puts "ref: #{ref}"
    puts "ID: #{music_id}, Publish Date: #{music_publish_date}, On Spotify: #{music_on_spotify}, Archived: #{music_archived}, Genre: #{music_genre}, Author: #{music_author}, Label: #{music_label}" # rubocop:disable Layout/LineLength
    # add_music(music_publish_date, music_on_spotify)
    add_full_music(line)
  end
end
