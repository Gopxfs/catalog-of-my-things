require_relative './music/music_methodes'

def read_music(file)
    file.each do |line|
        music_id = line['value']['id']
        music_publish_date = line['value']['publish_date']
        music_on_spotify = line['value']['on_spotify']
        music_archived = line['value']['archived']
        puts "ID: #{music_id}, Publish Date: #{music_publish_date}, On Spotify: #{music_on_spotify}, Archived: #{music_archived}" # rubocop:disable Layout/LineLength
        add_music(music_publish_date, music_on_spotify)
    end
end

def read_genre(file)
    puts ''
    puts '===============   Genre List   ==============='
    puts ''
    file.each_line do |line|
        genre_id = line['value']['id']
        genre_name = line['value']['name']
        puts "ID: #{genre_id}, Name: #{genre_name}"
    end
end