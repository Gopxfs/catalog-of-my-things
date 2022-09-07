require_relative './library_data/preserve_data/save_items'

def exit_app(app)
  puts 'Thank you for using this app! Now exiting...'
  save_items(app.books, app.labels)
  exit
end
