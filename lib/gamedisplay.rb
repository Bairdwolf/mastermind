class GameDisplay
  attr_accessor :top, :middle, :bottom

  def initialize(player = 'human')
    @@padding = '========================'
    @top = [@@padding, '| MASTERMIND | GUESSES |', @@padding]
    @middle = []
    bottom_message = ''
    bottom_message = '|GUESS THE CODE AND WIN|' if player == 'human'
    @bottom = [@@padding, bottom_message, @@padding]
  end

  def display_board
    display_section(top)
    display_section(middle_print(middle))
    display_section(bottom)
  end

  def display_section(arr)
    arr.each do |line|
      puts line
    end
  end

  def middle_new_round(round)
    if round < 10
      middle.push("|------------| ROUND 0#{round}|")
    else
      middle.push("|------------| ROUND #{round}|")
    end
    middle.push([Array.new(4) { 'white' }, Array.new(4) { 'x' }])
    display_board
  end

  def middle_new_guess(round, position, color)
    middle[round][0][position] = color
    display_board
  end

  def middle_all_guesses(round, guesses)
    middle[round][1] = guesses
    display_board
  end

  def pegs_colors(pegs)
    arr = pegs.map do |peg|
      if peg == 'x'
        '.'
      else
        Rainbow('o').send(peg)
      end
    end
    colored_pegs = arr.reduce(' | ') { |sum, o| sum + o + ' ' }
    colored_pegs + '|'
  end

  def guesses_colors(guesses)
    arr = guesses.map do |guess|
      Rainbow('0').send(guess)
    end
    colored_guesses = arr.reduce('| ') { |sum, o| sum + o + '  ' }
    colored_guesses.rstrip
  end

  def middle_print(middle)
    middle.map.with_index do |line, index|
      output = if (index + 1).even?
                 guesses_colors(line[0]) + pegs_colors(line[1])
               else
                 line
               end
      output
    end
  end

  def bottom_winner(name)
    bottom[1] = "|   #{name}   Wins!   |"
    display_board
  end
end
