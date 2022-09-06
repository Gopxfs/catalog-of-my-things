require_relative './genre'

def list_genre
    puts 'list_genre'
    @genres.each_with_index do |genre, index|
        puts "#{index}. #{genre.name}"
    end
end

def add_genre(genre_name)
    @genres << Genre.new(genre_name)
end
