require_relative ' rental'
class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def create_rental(date, person)
    Rental.new(date, self, person)
  end
end

my_book = Book.new('The Lord of the Rings', 'J. R. R. Tolkien')

p my_book.create_rental('2021-01-01', 'John Doe')
