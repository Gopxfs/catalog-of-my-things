require 'fileutils'
require 'json'

def create_dir
    Dir.exist?('./data') ? nil : create_files
end

def create_files
    Dir.mkdir_p('./data')
    FileUtils.touch('./data/music.json')
    FileUtils.touch('./data/genre.json')
end