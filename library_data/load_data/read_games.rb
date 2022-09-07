require 'json'

def read_games_from_file
  data_directory = './library_data/data/'.freeze

  if File.exist?("#{data_directory}games.json")
    games_file = File.open("#{data_directory}games.json")
    data = JSON.parse(games_file.read)
    data.each do |element|
      @games << Game.new(element['publish_date'], element['multiplayer'], element['last_played_at'], element['id'])
    end
    games_file.close
  else
    @games = []
    write_games_data
  end
end
