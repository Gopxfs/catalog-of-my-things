def save_authors(file, authors)
  authors_data = []
  authors.each do |author|
    author_items = save_author_items(author.items)
    authors_data.push({
                       id: author.id,
                       first_name: author.first_name,
                       last_name: author.last_name,
                       items: author_items
                     })
  end
  File.write(file, authors_data.to_json)
end

def save_author_items(items)
  authored_items = []
  items.each do |item|
    authored_items.push({
                         item_id: item.id,
                         item_class: item.class.name
                       })
  end
  authored_items
end
