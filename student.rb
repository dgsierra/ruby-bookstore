require_relative 'person'
class Student < Person
  attr_reader :classroom

  def initialize(id, age, classroom, name = 'Unknown Student', parent_permission: true)
    super(age, name)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
