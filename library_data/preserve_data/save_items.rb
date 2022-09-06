require 'json'

def save_items(books)
  check_directory
  save_item('books', books)
end

def save_item(file_name, item)
  file = check_file(file_name)
  File.write(file, JSON.generate(item))
end

def check_directory
  Dir.mkdir('library_data/data') unless File.exist?('./library_data/data')
end

def check_file(name)
  file = "library_data/data/#{name}.json"
  File.new(file, 'w+') unless File.exist?(file)
  return file
end
