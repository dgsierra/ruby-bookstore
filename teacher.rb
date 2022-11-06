require_relative 'person'
class Teacher < Person
  attr_accessor :specialization
  attr_reader :age

  def initialize(age, name, specialization)
    super(age, name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
