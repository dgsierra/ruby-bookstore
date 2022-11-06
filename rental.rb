class Rental
  attr_accessor :date, :person, :book

  def initialize(date, book, person)
    p person
    @person = person
    person.rentals << self
    @book = book
    book.rentals << self
    @date = date
  end
end
