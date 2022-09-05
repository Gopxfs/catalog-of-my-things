require_relative './music_album'

def list_music
    @music_list.each_with_index do |music, index|
        puts "(#{index}) ID: #{music.id}, Publish Date: #{music.publish_date}, On Spotify: #{music.on_spotify}, Archived: #{music.archived}"
    end
    end
end

def create_music
    puts 'Please enter the publish date'
    publish_date = gets.chomp
    puts 'Is it on Spotify? (true/false)'
    on_spotify = gets.chomp
    music = MusicAlbum.new(publish_date, on_spotify)
    @music_list << music
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