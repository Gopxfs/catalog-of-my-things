require_relative './library_data/preserve_data/save_items'

def exit_app(_app)
  puts 'Thank you for using this app! Now exiting...'
  save_items(_app.books, _app.labels)
  exit
end
