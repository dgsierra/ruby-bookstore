require_relative 'person'
class Teacher
  attr_accessor :specialization
  def initialize(age, name = 'Unknown', parent_permission, specialization)
    super(age, name = 'Unknown', parent_permission = true)
    @specialization = specialization
  end
  def can_use_services?
    true
  end
end

tom = Teacher.new(20, 'nombre del pibe', false, 'math')
