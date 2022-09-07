require 'json'
require_relative './save_books'

def save_items(books, _labels)
  check_directory
  save_books(check_file('books'), books)
end

def check_directory
  Dir.mkdir('library_data/data') unless File.exist?('./library_data/data')
end

def check_file(name)
  file = "library_data/data/#{name}.json"
  File.new(file, 'w+') unless File.exist?(file)
  file
end
