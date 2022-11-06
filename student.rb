require_relative 'person'
class Student < Person
  attr_reader :classroom

  def initialize
    super(age, name)
    @classroom = 'Unknown'
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
