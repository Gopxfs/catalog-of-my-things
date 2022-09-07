require 'json'
require './book'

def load_books
  return [] unless file_exist?
  return [] if File.zero?('./library_data/data/books.json')

  books = JSON.parse(File.read('./library_data/data/books.json'))
  
  books.map {|book| JSON.parse(book.to_json, create_additions: true)}

  return books
end

def file_exist?
  return false unless File.exist?('./library_data/data/books.json')
  return true
end
