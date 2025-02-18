class HumanPlayer < Player
  attr_reader :name

  def initialize
    @name = '   Human'
  end

  def make_choice(phase, *position)
    output = ''
    output = ask_input(phase)
    output
  end

  def ask_input(phase)
    begin
      if phase=='guess'
        puts 'Select a color: blue, green, yellow, pink, purple, orange'
      else
        puts 'Secret Code: Select a color: blue, green, yellow, pink, purple, orange'
      end
      #input='blue'
      input = gets.chomp.to_s
      choices = %w[blue green yellow pink purple orange]
      raise StandardError.new 'Invalid input' if choices.none?(input)
    rescue StandardError => e
      puts "\tError: #{e}"
      retry
    end
    input
  end

  def remove_data(guesses, guesses_checked)
  end
end
