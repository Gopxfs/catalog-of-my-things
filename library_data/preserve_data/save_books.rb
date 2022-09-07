def save_books(file, books)
  books_data = []
  books.each do |book|
    books_data.push({
      publish_date: book.publish_date,
      publisher: book.publisher,
      cover_state: book.cover_state,
      id: book.id
    })
  end
  File.write(file, books_data.to_json)
end
