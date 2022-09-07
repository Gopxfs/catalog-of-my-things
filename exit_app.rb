require_relative './library_data/preserve_data/save_items'
require_relative './create_json'

def exit_app(app)
  puts 'Thank you for using this app! Now exiting...'
  create_dir
  save_items(app.books, app.labels)