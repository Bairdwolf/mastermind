class HumanPlayer < Player
  attr_reader :name
  def initialize()
    @name='   Human'
  end
  def make_choice(phase)
    output= ''
    if phase=='guess'
      output= ask_input()
    end
    output
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