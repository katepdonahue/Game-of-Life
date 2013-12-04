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
    if (self.h+1 < game_object.height) && (self.w-1 >= 0)
      (neighbors << game_object.screen.board[self.h+1][self.w-1]); end  # row below
    if self.h+1 < game_object.height
      (neighbors << game_object.screen.board[self.h+1][self.w]); end      # row below
    if (self.h+1 < game_object.height) && (self.w+1 < game_object.width)
    (neighbors << game_object.screen.board[self.h+1][self.w+1]); end      # row below
    neighbors
  end

  def live_neighbors(neighbors_array)
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