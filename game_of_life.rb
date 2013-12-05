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


my_game = Game.new(10, 10)
my_game.screen.print_screen
sleep(0.1)
my_game.generation.print_screen
sleep(0.1)
my_game.generation.print_screen