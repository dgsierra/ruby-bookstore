require_relative 'person'
class Student < Person
  attr_reader :classroom

  def initialize(_id, age, classroom, name = 'Unknown Student')
    super(age, name, parent_permission: true)
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
