class ComputerPlayer < Player
  attr_reader :name

  def initialize
    @name = 'Computer'
  end

  def make_choice(phase)
    if phase == 'setup'
     %w[blue green yellow pink purple orange].sample
    else
      sleep(1)
      %w[blue green yellow pink purple orange].sample
      #actual guessing algorithm
    end
  end
end
