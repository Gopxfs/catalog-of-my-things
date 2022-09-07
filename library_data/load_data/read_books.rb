require 'json'
require './book'

def load_books
  file = './library_data/data/books.json'

  return [] unless File.exist?(file)
  return [] if File.zero?(file)

  books = []
  books_data = JSON.parse(File.read(file))

  books_data.each do |book|
    books.push(Book.new(book['publish_date'], book['publisher'], book['cover_state'], book['id']))
  end

  books
end
