## live cells:
# 0 or 1 live neighbors: dies
# 2 or 3 live neighbors: lives
# 4 - 8 live neighbors: dies
## dead cells:
# 3 live neighbors: comes back to life
require 'debugger'
require './board/board'
require './game/game'
require './cell/cell'


my_game = Game.new(30, 30)

# (2..9).each do |i|
#   my_game.block(i*3, i*3)
# end
# my_game.se_glider(1, 0).ne_glider(27, 2).r_spaceship(10, 0)
my_game.se_glider(1,0).ne_glider(27, 2) #.l_spaceship(15, 29)
my_game.screen.print_screen
loop do
  sleep(0.2)
  my_game.generation.print_screen
end