require_relative 'person'
class Student < Person
  def initialize
    super(age, name)
    @classroom = 'Unknown'
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end

obj = Student.new

p obj.play_hooky
