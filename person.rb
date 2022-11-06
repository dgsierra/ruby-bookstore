require_relative 'nameable'
class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id, :parent_permission

  def initialize(id, age, name = 'Unknown', parent_permission: true)
    super()
    @name = name
    @parent_permission = parent_permission
    @id = id
    @age = age
  end

  # Name changed of is_of_age? to avoid Rubocop error
  def of_age?
    @age >= 18
  end

  def correct_name
    @name
  end

  def can_use_services?
    @parent_permission or of_age?
  end
  private :of_age?
end
