require_relative 'person'
class Student < Person
  def initialize
    @classroom = "Unknown"
    @classroom = gets.chomp
  end
  def play_hooky
    "¯\(ツ)/¯"
  end
end
