require 'date'

class Item
  attr_accessor :publish_date
  def initialize(id, publish_date, archived: false)
    @id = id
    @publish_date = Date.parse(publish_date) #publish_date should be a string = 'DD-MM-YYYY' or 'DD/MM/YYYY'
    @archived = archived
  end
  
  def add_genre(genre)
    @genre = genre
  end

  def add_author(author)
    @author = author
  end

  def add_label(label)
    @label = label
  end

  def can_be_archived?
    if DateTime.now.year - @publish_date.year > 10
      return true
    end
    false
  end

  def move_to_archive
    if can_be_archived?
      @archived = true
    end
  end
end
