def save_genres(file, genres)
  genres_data = []
  genres.each do |genre|
    genre_items = save_genre_items(genre.items)
    genres_data.push({
                       name: genre.name,
                       id: genre.id,
                       items: genre_items
                     })
  end
  File.write(file, genres_data.to_json)
end

def save_genre_items(items)
  genre_items_array = []
  items.each do |item|
    genre_items_array.push({
                             item_id: item.id,
                             item_class: item.class.name
                           })
  end
  genre_items_array
end
