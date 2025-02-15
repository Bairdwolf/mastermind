require 'pry-byebug'

class ComputerPlayer < Player
  attr_reader :name
  attr_accessor :working_memory
  attr_accessor :set

  def initialize
    @name = 'Computer'
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
    if self.set.length==1296
      return [1, 1, 2, 2]
    else
      guess_list=Hash.new
      for guess in create_set() do
        #return the value of the minmax function, use as key, then just use the guess as the value
        guess_list[min_max(guess)]=guess
      end
    end
  end
  
  def min_max(guess)
    set_list=Hash.new
    for i in self.set do
      #compare each item in the set to each possible code
      #find out the worst case scenario. length of set-hit_count
      set_list[i]=compare(i, guess)
    end
    smallest=set_list.values.max
    return self.set.length-set_list.select{|key, value| value==smallest}.length
  end


  def remove_data(guesses, guesses_checked)
    guess_numbers=guesses.map{|guess| encode_color(guess)}
    self.set.select! {|i| compare(i, guess_numbers)==guesses_checked}
  end


  def compare(i, guesses)
    unsorted = guesses.map.with_index do |guess, index|
      if i[index] == guess
        'red'
      elsif i.any?(guess)
        'white'
      else
        'x'
      end
    end
    unsorted.sort
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

end
