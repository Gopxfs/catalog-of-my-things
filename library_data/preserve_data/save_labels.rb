def save_labels(file, labels)
  labels_data = []
  labels.each do |label|
    label_items = save_label_items(label.items)
    labels_data.push({
                      title: label.title,
                      color: label.color,
                      id: label.id,
                      items: label_items
                    })
  end
  File.write(file, labels_data.to_json)
end

def save_label_items(items)
  labeled_items = []
  items.each do |item|
    labeled_items.push({
      item_id: item.id,
      item_class: item.class.name
    })
  end
  labeled_items
end