require 'pry-byebug'

class ComputerPlayer < Player
  attr_reader :name
  attr_accessor :data
  attr_accessor :working_memory
  attr_accessor :set

  def initialize
    @name = 'Computer'
    @data=[]
    @working_memory=[]
    @set=create_set()
  end

  def create_set()
    six_range=Array(1..6)
    return six_range.product(six_range, six_range, six_range)
  end

  def make_choice(phase, *position)
    if phase == 'setup'
     %w[blue green yellow pink purple orange].sample
    else
      sleep(1.5)
      choose_from_memory(position[0])      
    end
  end

  def choose_from_memory(position)
    if position==1
      self.working_memory=guessing_algorithm()
    end
    return decode_number(self.working_memory[position-1])
  end

  def guessing_algorithm()
    if self.data.empty?
      return [1, 1, 2, 2]
    else
    end
  end

  def encode_color(color)
    case color
    when 'blue'
      return 1
    when 'green'
      return 2
    when 'yellow'
      return 3
    when 'pink'
      return 4
    when 'purple'
      return 5
    when 'orange'
      return 6
    end
  end

  def decode_number(num)
    case num
    when 1
      return 'blue'
    when 2
      return 'green'
    when 3
      return 'yellow'
    when 4
      return 'pink'
    when 5
      return 'purple'
    when 6
      return 'orange'
    end
  end

  def add_data(guesses)
    self.data.push(guesses.map{|guess| encode_color(guess)})
  end

end
