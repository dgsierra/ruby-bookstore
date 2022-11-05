require_relative 'decorator'

class Capitalize < Decorator
  def initialize
    super
  end
  def correct_name
    @nameable.correct_name.capitalize
  end
end
