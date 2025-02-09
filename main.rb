require_relative('lib/game')
require_relative('lib/player')
require_relative('lib/computerplayer')
require_relative('lib/gamedisplay')
require_relative('lib/humanplayer')
require('rainbow')

def choose_side()
  begin
    puts 'Chose a side: Coder or guesser'
    input = gets.chomp.to_s.downcase
    choices = %w[coder guesser]
    raise StandardError.new 'Invalid input' if choices.none?(input)
  rescue StandardError => e
    puts "\tError: #{e}"
    retry
  end
  input
end

game = Game.new(choose_side())
# creates game object with choice of side
game.play
