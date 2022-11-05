require_relative 'person'
require_relative 'capitalize'
require_relative 'trim'

person = Person.new(1, 22, 'maximilianus')
person.correct_name
name_uppercase = Capitalize.new(person)
puts name_uppercase.correct_name
test1 = Trimmer.new(name_uppercase)
puts test1.correct_name
