require 'json'

def load_labels
  return [] unless file_exist?
  return [] if File.zero?('./library_data/data/labels.json')

  ################
end

def file_exist?
  return false unless File.exist?('./library_data/data/labels.json')

  true
end
