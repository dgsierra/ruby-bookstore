class Person
  attr_accessor :name, :age
  attr_reader :id, :parent_permission

  def initialize(age, name = 'Unknown', parent_permission: true)
    @name = name.chomp
    @parent_permission = parent_permission
    @id = 'Unknown'
    @age = age
  end

  # Name changed of is_of_age? to avoid Rubocop error
  def of_age?
    @age >= 18
  end

  def can_use_services?
    @parent_permission or of_age?
  end
  private :of_age?
end

myperson = Person.new(19, 'Daniel', parent_permission: false)

p myperson.parent_permission
