require_relative('lib/game')
require_relative('lib/player')
require_relative('lib/computerplayer')
require_relative('lib/gamedisplay')
require_relative('lib/humanplayer')
require('rainbow')

game = Game.new('human')
# creates game object with hardcoded human player guessing
game.play
