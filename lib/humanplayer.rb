class HumanPlayer < Player
  attr_reader :name
  def initialize()
    @name='   Human'
  end
  def make_choice(phase)
    if phase=='guess'
      return ask_input()
    end
  end

  def ask_input()
    begin
      puts 'Select a color: blue, green, yellow, pink, purple, orange'
      input = gets.chomp.to_s
      choices=['blue', 'green', 'yellow', 'pink', 'purple', 'orange']
      raise StandardError.new 'Invalid input' if choices.none?(input)
    rescue StandardError => e
      puts "\tError: #{e}"
      retry
    end
    input
  end
end