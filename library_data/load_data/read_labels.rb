require 'json'
require './label'

def load_labels(books)
  file = './library_data/data/labels.json'

  return [] unless File.exist?(file)
  return [] if File.zero?(file)

  labels = []
  labels_data = JSON.parse(File.read(file))

  labels_data.each do |label|
    new_label = Label.new(label['title'], label['color'], label['id'])
    load_items(new_label, label['items'], books)
    labels.push(new_label)
  end
  labels
end

def load_items(label, items, books)
  items.each do |item|
    books.each do |book|
      label.add_item(book) if book.id == item['item_id'] && book.instance_of?(item)
    end
  end
end
