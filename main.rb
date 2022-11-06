require_relative './student'
require_relative './teacher'
require_relative './rental'
require_relative './books'

class App
  def initialize
    @people = []
    @books = []
    @@id = 50
  end

  def run
    selection = nil
    puts 'Welcome to School Library App!'
    while selection != 7
      display_options
      selection = gets.chomp.strip.to_i
      do_task(selection)
    end
    puts 'Thank you for using this app!'
  end
