require 'json'
require_relative './save_books'
require_relative './save_labels'
require_relative './save_musics'
require_relative './save_genres'
require_relative './save_authors'

def save_items(books, labels, musics, genres, authors)
  check_directory
  save_books(check_file('books'), books)
  save_labels(check_file('labels'), labels)
  save_musics(check_file('musics'), musics)
  save_genres(check_file('genres'), genres)
  save_authors(check_file('authors'), authors)
end

def check_directory
  Dir.mkdir('library_data/data') unless File.exist?('./library_data/data')
end

def check_file(name)
  file = "library_data/data/#{name}.json"
  File.new(file, 'w+') unless File.exist?(file)
  file
end
