require 'json'
require './genre/genre'

def load_genres(books, games, musics)
  file = './library_data/data/genres.json'

  return [] unless File.exist?(file)
  return [] if File.zero?(file)

  genres = []
  genres_data = JSON.parse(File.read(file))

  genres_data.each do |genre|
    new_genre = Genre.new(genre['name'], genre['id'])
    load_items(new_genre, genre['items'], books, games, musics)
    genres.push(new_genre)
  end

  genres
end
# rubocop:disable all
def load_items(genre, items, books, games, musics)
  objects = books + games + musics
  items.each do |item|
    objects.each do |object|
      if object.id == item['item_id'] && object.class.name == item['item_class']
        genre.add_item(object)
      end
    end
  end
end
