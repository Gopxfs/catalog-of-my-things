require 'json'
require './label'

def load_labels(books, games, musics)
  file = './library_data/data/labels.json'

  return [] unless File.exist?(file)
  return [] if File.zero?(file)

  labels = []
  labels_data = JSON.parse(File.read(file))

  labels_data.each do |label|
    new_label = Label.new(label['title'], label['color'], label['id'])
    load_items(new_label, label['items'], books, games, musics)
    labels.push(new_label)
  end

  labels
end
# rubocop:disable all
def load_items(label, items, books, games, musics)
  objects = books + games + musics
  items.each do |item|
    objects.each do |object|
      if object.id == item['item_id'] && object.class.name == item['item_class']
        label.add_item(object)
      end
    end
  end
end
