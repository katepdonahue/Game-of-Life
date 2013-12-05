require 'debugger'

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

  def live_neighbors(neighbors_array)
    # neighbors_array.map {|cell| cell.state}
    neighbors_array.select { |cell| cell.state == "0"} # undefined method `state' for nil:NilClass (NoMethodError)
  end

  def find_neighbors
    neighbors = []
    if w-1 >= 0 
      (neighbors << game_object.screen.board[h][w-1]); end    # left
    if w+1 < game_object.width
      (neighbors << game_object.screen.board[h][w+1]); end    # right
    if (h-1 >= 0) && (w-1 >= 0)
      (neighbors << game_object.screen.board[h-1][w-1]); end  # row above
    if h-1 >= 0
      (neighbors << game_object.screen.board[h-1][w]); end    # row above
    if (h-1 >= 0) && (w+1 < game_object.width)
      (neighbors << game_object.screen.board[h-1][w+1]); end  # row above
    if (h+1 < game_object.height) && (w-1 >= 0)
      (neighbors << game_object.screen.board[h+1][w-1]); end  # row below
    if h+1 < game_object.height
      (neighbors << game_object.screen.board[h+1][w]); end      # row below
    if (h+1 < game_object.height) && (w+1 < game_object.width)
    (neighbors << game_object.screen.board[h+1][w+1]); end      # row below
    live_neighbors(neighbors)
  end

  def copy_cell
    new_cell = Cell.new(self.state, game_object)
    new_cell.h = self.h
    new_cell.w = self.w
    new_cell
  end

  def tick
    new_cell = self.copy_cell
    num = find_neighbors.count
    if self.state == "0" # cell is alive
      new_cell.state = "-" if (num < 2) || (num > 3) #underpopulation and overcrowding
    else # cell is dead
      new_cell.state = "0" if num == 3
    end
    new_cell
  end

end