class Rental
  attr_accessor :date, :person, :book

  def initialize(date, person, book)
    @date = date
    @person = person
    return person.rentals
    person.rentals << self
    @book = book
    return book
    book.rentals << self
  end
end
