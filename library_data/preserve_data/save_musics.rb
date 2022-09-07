def save_musics(file, musics)
  musics_data = []
  musics.each do |music|
    musics_data.push({
                      publish_date: music.publish_date,
                      on_spotify: music.on_spotify,
                      id: music.id
                    })
  end
  File.write(file, musics_data.to_json)
end
