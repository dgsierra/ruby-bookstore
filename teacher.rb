require_relative 'person'
class Teacher < Person
  attr_accessor :specialization
  attr_reader :age

  def initialize(id, age, name, specialization)
    super(id, age, name, parent_permission: parent_permission)
    @name = name
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
