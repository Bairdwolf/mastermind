class ComputerPlayer < Player
  attr_reader :name

  def initialize
    @name = 'Computer'
  end

  def make_choice(phase)
    return unless phase == 'setup'

    %w[blue green yellow pink purple orange].sample
  end
end
