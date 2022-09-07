require 'json'

def save_items(books, labels)
  check_directory
  save_item('books', books)
  save_item('labels', labels)
end

def save_item(file_name, items)
  file = check_file(file_name)
  #########
end

def check_directory
  Dir.mkdir('library_data/data') unless File.exist?('./library_data/data')
end

def check_file(name)
  file = "library_data/data/#{name}.json"
  File.new(file, 'w+') unless File.exist?(file)
  return file
end
