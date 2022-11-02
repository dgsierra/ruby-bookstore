class Person
  def initialize
    @name = "Unknown"
    @parent_permission = true
    @name = gets.chomp
    @id = gets.chomp
    @age = gets.chomp
  end
  def test
    "test"
  end
  def can_use_services?
    @parent_permission or @age >= 18
  end
  def validate_name
    @name != ""
  end
  def id
    @id
  end
  def name
    @name
  end
  def age
    @age
  end
  def age=(new_age)
    @age = new_age
  end
  def name=(new_name)
    @name = new_name
  end
end

my_class = Person.new
p my_class.test
