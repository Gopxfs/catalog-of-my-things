require 'json'
require_relative '../music/music_album'

module MusicData
    def save_music(musics)
        data = musics.map do |music|
            music.to_hash
        end
        File.write('./data/music.json', JSON.pretty_generate(data))
    end
    
end