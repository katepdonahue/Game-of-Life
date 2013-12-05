class Game
  attr_reader :height, :width
  attr_accessor :screen

  def initialize(height, width)
    @height = height
    @width = width
    @screen = Board.new(self)
    populate
  end

  def populate
    height.times do |y|
      width.times do |x|
        screen.board[y] << Cell.new(".", self).tap{|c| c.h=y; c.w=x}
      end
    end
  end

  def generation
    new_screen = Board.new(self)
    screen.board.each do |array|
      array.each do |cell|
        new_screen.board[cell.h][cell.w] = cell.tick
      end
    end
    self.screen = new_screen
  end

######### methods for setting initial state ###########
  def block(y_x)
    screen.board[y_x[0]][y_x[1]].state = "o"
    screen.board[y_x[0]][y_x[1]+1].state = "o"
    screen.board[y_x[0]+1][y_x[1]+1].state = "o"
    screen.board[y_x[0]+1][y_x[1]].state = "o"
  end

  def glider(y_x)
    screen.board[y_x[0]][y_x[1]].state = "o"
    screen.board[y_x[0]+1][y_x[1]+1].state = "o"
    screen.board[y_x[0]+1][y_x[1]+2].state = "o"
    screen.board[y_x[0]][y_x[1]+2].state = "o"
    screen.board[y_x[0]-1][y_x[1]+2].state = "o"
  end

  def born(coordinates)
    coordinates.each do |y_x|
      screen.board[y_x[0]][y_x[1]].state = "o"
    end
  end

#######################################################


end


