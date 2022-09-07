require 'json'
require './author'

def load_authors(books, games, musics)
  file = './library_data/data/authors.json'

  return [] unless File.exist?(file)
  return [] if File.zero?(file)

  authors = []
  authors_data = JSON.parse(File.read(file))

  authors_data.each do |author|
    new_author = Author.new(author['id'], author['first_name'], author['last_name'])
    load_items(new_author, author['items'], books, games, musics)
    authors.push(new_author)
  end

  authors
end
# rubocop:disable all
def load_items(author, items, books, games, musics)
  objects = books + games + musics
  items.each do |item|
    objects.each do |object|
      if object.id == item['item_id'] && object.class.name == item['item_class']
        author.add_item(object)
      end
    end
  end
end
