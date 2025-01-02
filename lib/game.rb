#choose code function takes player argument and returns an array of colors
#code=choose code()
#use colorize for guesser pegs

class Game
  attr_accessor :round, :game_display, :winner
  attr_reader :code, :players
  def initialize(player)
    @round=1
    #first one in players array is coder, second is guesser
    if player=='human'
      @players=[ComputerPlayer.new(), HumanPlayer.new()]
      @game_display=GameDisplay.new(player)
    else
      @players=[HumanPlayer.new(), ComputerPlayer.new()]
      @game_display=GameDisplay.new(player)
    end
    @winner=0
    @code=get_code(@players[0], 'setup')
    #update and display board only if computer guessing
  end

  def play()
    until self.round==13 || (self.winner)!=0
      guesses=play_round(self.round)
      guesses_checked=compare(guesses)
      self.game_display.middle_all_guesses((self.round*2)-1, guesses_checked)
      if guesses_checked.all?('red')
        self.winner=1
      else
        self.round+=1
      end
    end
    self.game_display.bottom_winner((self.players[self.winner]).name)
  end

  def get_code(player, phase)
    output=[]
    4.times do
      output.push(player.make_choice(phase))
  
    end
    output
  end

  def play_round(round)
    # CHEAT MODE
    puts self.code
    self.game_display.middle_new_round(round)
    position=1
    guesses=[]
    while position<5
      choice=players[1].make_choice('guess')
      guesses.push(choice)
      self.game_display.middle_new_guess((round*2)-1, position-1, choice)
      position+=1
    end
    guesses
  end

  def compare(guesses)
    unsorted=guesses.map.with_index do |guess, index|
      if self.code[index]==guess
        'red'
      elsif self.code.any?(guess)
        'white'
      else
        'x'
      end 
    end
    return unsorted.sort
  end

end



#========================
#| MASTERMIND | GUESSES |
#========================
#|------------| ROUND 01|
#| 0  0  0  0 | o o o o | 
#|------------| ROUND 02|