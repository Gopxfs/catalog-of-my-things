require_relative './create_json'

def exit_app(app)
  puts 'Thank you for using this app! Now exiting...'
  create_dir
  app.save_files
  exit
end
