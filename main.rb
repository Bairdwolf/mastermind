require_relative('lib/game')
require_relative('lib/player')
require_relative('lib/computerplayer')
require_relative('lib/gamedisplay')
require_relative('lib/humanplayer')
require ('rainbow')

game=Game.new('human')
#creates game object with hardcoded human player guessing
game.play()


#game object with player, humanplayer <player, computerplayer <player
#counts rounds
#choose code function takes player argument and returns an array of colors
#code=choose code()
#board and display are still present
#use colorize for guesser pegs
#width: 14
#sidebox: 10
#TOP: 24
#========================
#| MASTERMIND | GUESSES |
#|============| ROUND 01|
#| 0  0  0  0 | o o o o | 
#|============| ROUND 02|