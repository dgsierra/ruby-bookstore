require_relative 'nameable'
require_relative 'rental'
class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :id, :parent_permission

  def initialize(id, age, name = 'Unknown', parent_permission: true)
    super()
    @name = name
    @parent_permission = parent_permission
    @id = id
    @age = age
    @rentals = []
  end

  # Name changed of is_of_age? to avoid Rubocop error
  def of_age?
    @age >= 18
  end

  def correct_name
    @name
  end

  def new_rental(date, book)
    p self
    Rental.new(date, self, book)
  end

  def can_use_services?
    @parent_permission or of_age?
  end
  private :of_age?
end

test2 = Person.new(1, 20, 'test')

p test2.new_rental('2021-01-01', 'test')
