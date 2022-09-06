require 'json'

def write_games_data
  data_directory = './library_data/data/'.freeze

  data = if @games.length.positive?
           @games.map do |game|
             { publish_date: game.publish_date, multiplayer: game.multiplayer, last_played_at: game.last_played_at,
               id: game.id }
           end
         else
           []
         end
  games_file = File.open("#{data_directory}games.json", 'w')
  games_file.write(JSON.pretty_generate(data))
  games_file.close
end
