require_relative 'person'
class Student < Person
  def initialize
    super
    @classroom = 'Unknown'
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
