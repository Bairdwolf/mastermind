class ComputerPlayer <Player
  attr_reader :name
  def initialize()
    @name= 'Computer'
  end

  def make_choice(phase)
    if phase=='setup'
      output=['blue', 'green', 'yellow', 'pink', 'purple', 'orange'].sample()
      output
    end
  end
end