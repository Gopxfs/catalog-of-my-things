require 'date'

class Item
  attr_reader :id, :genre, :publish_date, :archived, :author, :label

  def initialize(id = Random.rand(1..10_000))
    @id = id
    @publish_date = nil
    @archived = false
  end

  def add_genre(genre)
    genre.is_a?(Genre) && @genre.nil? && (
      @genre = genre
      genre.add_item(self)
    )
  end

  def add_author(author)
    author.is_a?(Author) && @author.nil? && (
      @author = author
      author.add_item(self)
    )
  end

  def add_label(label)
    label.is_a?(Label) && @label.nil? && (
      @label = label
      label.add_item(self)
    )
  end

  def can_be_archived?
    return true if DateTime.now.year - @publish_date.year > 10

    false
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
