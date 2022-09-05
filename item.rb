require 'date' 

class Item
  attr_accessor :publish_date

  def initialize(id = Random.rand(1..1000))
    @id = id
    @genre = nil
    @author = nil
    @label = nil
    @publish_date = nil
    @archived = false
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
    return true if DateTime.now.year - @publish_date.year > 10

    false
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
