# code=choose code()
# use colorize for guesser pegs

class Game
  attr_accessor :round, :game_display, :winner
  attr_reader :code, :players

  def initialize(player)
    @round = 1
    # first one in players array is coder, second is guesser
    if player == 'guesser'
      @players = [ComputerPlayer.new, HumanPlayer.new]
      @game_display = GameDisplay.new(player)
      @code = get_code(@players[0], 'setup')
    else
      @players = [HumanPlayer.new, ComputerPlayer.new]
      @code = get_code(@players[0], 'setup')
      @game_display = GameDisplay.new(player, self.code)
    end
    @winner = 0
  end

  def play
    until round == 13 || winner != 0
      guesses = play_round(round)
      self.players[1].add_data(guesses)
      guesses_checked = compare(guesses)
      game_display.middle_all_guesses((round * 2) - 1, guesses_checked)
      if guesses_checked.all?('red')
        self.winner = 1
      else
        self.round += 1
      end
    end
    game_display.bottom_winner(players[winner].name)
  end

  def get_code(player, phase)
    output = []
    4.times do
      output.push(player.make_choice(phase))
    end
    output
  end

  def play_round(round)
    game_display.middle_new_round(round)
    position = 1
    guesses = []
    while position < 5
      choice = players[1].make_choice('guess', position)
      guesses.push(choice)
      game_display.middle_new_guess((round * 2) - 1, position - 1, choice)
      position += 1
    end
    guesses
  end

  def compare(guesses)
    unsorted = guesses.map.with_index do |guess, index|
      if code[index] == guess
        'red'
      elsif code.any?(guess)
        'white'
      else
        'x'
      end
    end
    unsorted.sort
  end
end

#========================
# | MASTERMIND | GUESSES |
#========================
# |------------| ROUND 01|
# | 0  0  0  0 | o o o o |
# |------------| ROUND 02|
