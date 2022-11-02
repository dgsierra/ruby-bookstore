class Person
  attr_accessor :name, :age
  attr_reader :id, :parent_permission

  def initialize(age, name = 'Unknown', parent_permission = true)
    @name = name.chomp
    @parent_permission = parent_permission
    @id = 'Unknown'
    @age = 19
  end

  def of_age? # Name changed of is_of_age? to avoid Rubocop error
    @age >= 18
  end

  def can_use_services?
    @parent_permission or is_of_age?
  end
  private :of_age?
end
