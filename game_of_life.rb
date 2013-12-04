## live cells:
# 0 or 1 live neighbors: dies
# 2 or 3 live neighbors: lives
# 4 - 8 live neighbors: dies
## dead cells:
# 3 live neighbors: comes back to life
require 'debugger'

class Game
  attr_reader :height, :width
  attr_accessor :screen

  def initialize(height, width)
    @height = height
    @width = width
    @screen = Board.new(self)
    # debugger
    create_cells
    # debugger
    populate
    # debugger
    # generate_neighbors
    # debugger
    # puts 'hi'
  end

  def create_cells
    (height * width).times do
      Cell.new("0", self) # in this starting position they are all alive
    end
  end

  def populate # partition cells into #{height} arrays each with #{width} objects
    array_i = 0
    Cell::CELLS.each_with_index do |cell, i|
      # debugger
      array_i += 1 if (i % width == 0) && (i != 0)
      cell.h = array_i
      cell.w = i % width
      # debugger
      screen.board[array_i] << cell # populate screen
    end
  end

  def generation
    new_screen = Board.new(self)
    screen.board.each do |array|
      # debugger
      array.each do |cell|
        # debugger
        new_screen.board[cell.h][cell.w] = cell.tick
      end
    end
    new_screen
  end

end

class Board
  attr_reader :board

  def initialize(game_object)
    @board = []
    generate_screen(game_object)
    # debugger
  end

  def generate_screen(game_obj)
    game_obj.height.times do
      board << []
    end
  end

  def print_screen
    # debugger
    self.board.each do |array|
      array.each do |cell|
        print cell.state
      end
      print "\n"
    end
  end

end

class Cell
  attr_accessor :state, :screen, :h, :w
  attr_reader :neighbors, :game_object
  CELLS = []

  def initialize(state, game_object)
    @state = state
    @h # height index
    @w # width index
    CELLS << self
    @game_object = game_object
  end

  def find_neighbors
    neighbors = []
    if self.w-1 >= 0 
      (neighbors << game_object.screen.board[self.h][self.w-1]); end    # left
    if self.w+1 < game_object.width
      (neighbors << game_object.screen.board[self.h][self.w+1]); end    # right
    if (self.h-1 >= 0) && (self.w-1 >= 0)
      (neighbors << game_object.screen.board[self.h-1][self.w-1]); end  # row above
    if self.h-1 >= 0
      (neighbors << game_object.screen.board[self.h-1][self.w]); end    # row above
    if (self.h-1 >= 0) && (self.w+1 < game_object.width)
      (neighbors << game_object.screen.board[self.h-1][self.w+1]); end  # row above
    # debugger
    if (self.h+1 < game_object.height) && (self.w-1 >= 0)
      (neighbors << game_object.screen.board[self.h+1][self.w-1]); end  # row below
    if self.h+1 < game_object.height
      (neighbors << game_object.screen.board[self.h+1][self.w]); end      # row below
    if (self.h+1 < game_object.height) && (self.w+1 < game_object.width)
    (neighbors << game_object.screen.board[self.h+1][self.w+1]); end      # row below
    neighbors
  end

  def live_neighbors(neighbors_array)
    # debugger
    neighbors_array.select { |cell| cell.state == "0"} # undefined method `state' for nil:NilClass (NoMethodError)
  end

  def tick
    if self.state == "0" # cell is alive
    num = self.live_neighbors(self.find_neighbors).count
      # debugger
      if (num < 1) || (num > 3)
        self.state = "-"
      end
    else # cell is dead
      if self.live_neighbors(self.find_neighbors).count == 3
        self.state = "0"
      end
    end
    self
  end

end

my_game = Game.new(10, 30)
my_game.screen.print_screen
sleep(0.5)
my_game.generation.print_screen


# def generate_neighbors
#   Cell::CELLS.each do |cell|
#     cell.find_neighbors
#   end
# end

# def check_neighbors
#     Cell::CELLS.each do |cell|
#       cell.neighbors.each_with_index do |x, i|
#         if x.nil?
#           puts i
#         end
#       end
#     end
#   end

# def change
#   if self.state == " "
#     self.state = "0"
#   else
#     self.state = " "
#   end
# end


# def generation
#     new_screen = []
#     generate_screen(new_screen)
#     screen.each do |array|
#       array.each do |cell|
#         if cell.state == "0" # cell is alive
#           if (cell.live_neighbors.count < 1) || (cell.live_neighbors.count > 3)
#             cell.change
#           end
#         else # cell is dead
#           if cell.live_neighbors.count == 3
#             cell.change
#           end
#         end
#       end
#     end
#   end