#choose code function takes player argument and returns an array of colors
#code=choose code()
#use colorize for guesser pegs

class Game
  def initialize(player)
    @round=1
    @game_display=GameDisplay.new()
    #first one in players array is coder, second is guesser
    if player=='human'
      @players=[ComputerPlayer.new(), HumanPlayer.new()]
    else
      @players=[HumanPlayer.new(), ComputerPlayer.new()]
    end
    @winner=2
    @code=get_code(@players[0], 'setup')
    #update and display board
  end

  def play()
    until self.round==13 || (self.winner)!=2
      guesses=play_round(self.round)
      guesses_checked=compare(guesses)
      #DISPLAY update guesses check
      if guesses_checked.all?('red')
        self.winner=self.players[1]
      else
        self.round+=1
      end
    end
    #display update winner
  end

  def get_code(player, phase)
    output=[]
    4.times do
      output.push(player.make_choice(phase))
    end
    output
  end

  def play_round(round)
    #update display with round at top
    position=1
    guesses=[]
    while position<5
      choice=players[1].make_choice('guess')
      guesses.push(choice)
      #change color of display based on choice
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