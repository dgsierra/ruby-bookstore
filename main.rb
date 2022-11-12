require_relative './student'
require_relative './teacher'
require_relative './books'
require_relative 'rental'
class Main
  def initialize
    @people = []
    @books = []
    @id = 0
    @message = ['Please choose an option /n by enterin a number:', '1 - List all books', '2 - List all people',
                '3 - Create a person', '4 - Create a book', '5 - Create a rental',
                '6 - List all rentals for a given person id', '7 - Exit']
  end

  def run
    selection = nil
    puts 'Welcome to School Library App!'
    while selection != 7
      display_options
      selection = gets.chomp.strip.to_i
      do_task(selection)
    end
    puts 'Thank you for using this Main!'
  end

  def display_options
    @message.each { |option| puts option }
  end

  def do_task(selection)
    case selection
    when 1, 2, 6
      list_tasks(selection)
    when 3, 4, 5
      create_tasks(selection)
    when 7
      nil
    else
      puts 'Wrong input, please select one of the options from the menu'
    end
  end

  def list_tasks(selection)
    case selection
    when 1
      list_all_books
    when 2
      list_all_people
    when 6
      list_person_rentals
    end
  end

  def create_tasks(selection)
    case selection
    when 3
      create_person
    when 4
      create_book
    when 5
      new_rental
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_selected = gets.chomp.strip.to_i
    case person_selected
    when 1
      create_student
      @id += 1
    when 2
      new_teacher
      @id += 1
    else
      'Invalid Selection. Returning to main menu'
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    if age <= 0
      @id -= 1
      return 'Wrong input for age. Returning to main menu'
    end
    print 'Name: '
    name = gets.chomp.strip.capitalize
    print 'Has Parent Permission? [Y/N]: '
    permission = gets.chomp.strip.upcase
    case permission
    when 'Y', 'YES'
      permission = true
    when 'N', 'NO'
      permission = false
    end
    student = Student.new(@id, age, nil, name, parent_permission: permission)
    @people << student
    puts 'Person created successfully'
  end

  def new_teacher
    print 'Age: '
    age = gets.chomp.to_i
    if age <= 18
      @id -= 1
      return 'Wrong input for age all teachers should be at least 18. Returning to main menu'
    end
    print 'Name: '
    name = gets.chomp.strip.capitalize
    print 'Specialization: '
    specialization = gets.chomp.strip.capitalize
    p "test teacher age: #{age}"
    teacher = Teacher.new(@id, age, name, specialization)
    @people << teacher
    puts 'Person created successfully'
  end

  def create_book
    print 'Title: '
    title = gets.chomp.strip.capitalize
    print 'Author: '
    author = gets.chomp.strip.capitalize
    book = Book.new(title, author)
    @books << book
    puts 'Book created successfully'
  end

  def list_all_people
    @people.each_with_index do |person, index|
      p "test person: #{person.class}"
      puts "#{index}) [#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def list_all_books
    @books.each_with_index { |book, index| puts %{#{index}) Title: "#{book.title}", Author: #{book.author}} }
  end

  def new_rental
    puts 'Select a book from the following list by number'
    list_all_books
    book_selected = gets.chomp.to_i
    puts 'Select a person from the following list by number (not id)'
    list_all_people
    person_selected = gets.chomp.to_i
    puts 'Date (YYYY/MM/DD) : '
    date = gets.chomp.strip.to_s
    p 'test rental'
    if !@people[person_selected].nil? || !@books[book_selected].nil?
      Rental.new(date, @books[book_selected], @people[person_selected])
      puts 'Rental created successfully'
    else
      'Wrong input. Returning to main menu'
    end
  end

  def list_person_rentals
    print 'ID of person: '
    id = gets.chomp.to_i
    puts 'Rentals: '
    @people.each do |person|
      next unless person.id == id

      person.rentals.each do |rental|
        puts %(Date: #{rental.date}, Book "#{rental.book.title}" by #{rental.book.author})
      end
    end
  end
end

def main
  main = Main.new
  main.run
end

main
