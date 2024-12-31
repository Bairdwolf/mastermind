#game object with player, humanplayer <player, computerplayer <player
#counts rounds
#choose code function takes player argument and returns an array of colors
#code=choose code()
#board and display are still present
#use colorize for guesser pegs

class Game
  def initialize(player)
    @round=0
    @board=Board.new()
    @game_display=GameDisplay.new()
    #first one in players array is coder, second is guesser
    if player=='human'
      @players=[ComputerPlayer.new(), HumanPlayer.new()]
    else
      @players=[HumanPlayer.new(), ComputerPlayer.new()]
    end
    @winner=2
  end

  def play()
    until self.round==12 || self.winner!=2
      
    end
  end
end