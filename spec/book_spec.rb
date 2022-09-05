require_relative './spec_helper'

describe Book do
  before :each do
    @book = Book.new(1, '05/09/2022', 'publisher', 'good')
    @old_book = Book.new(2, '05/09/1990', 'publisher', 'good')
    @book_in_a_bad_condition = Book.new(3, '05/09/2022', 'publisher', 'bad')
  end

  describe '#new' do
    it 'receives 4 parameters and return a Book object' do
      expect(@book).to be_an_instance_of Book
    end
  end

  describe '#can_be_archived?' do
    it "returns true if date < 10 years old OR if cover_state == 'bad'" do
      expect(@book.send(:can_be_archived?)).to eql false
      expect(@old_book.send(:can_be_archived?)).to eql true
      expect(@book_in_a_bad_condition.send(:can_be_archived?)).to eql true
    end
  end
end
