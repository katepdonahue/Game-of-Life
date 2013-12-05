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
  def filler(y, x)
    screen.board[y][x].state = "o"
  end

  def block(y, x)
    filler(y, x)
    filler(y, x+1)
    filler(y+1, x+1)
    filler(y+1, x)
    self
  end

  def se_glider(y, x)
    filler(y, x)
    filler(y+1, x+1)
    filler(y+1, x+2)
    filler(y, x+2)
    filler(y-1, x+2)
    self
  end

  def ne_glider(y, x)
    filler(y, x)
    filler(y-1, x+1)
    filler(y-2, x+1)
    filler(y-2, x)
    filler(y-2, x-1)
    self  
  end

  def r_spaceship(y, x)
    filler(y, x)
    filler(y-2, x)
    filler(y-3, x+1)
    filler(y-3, x+2)
    filler(y-3, x+3)
    filler(y-3, x+4)
    filler(y-2, x+4)
    filler(y-1, x+4)
    filler(y, x+3)
    self
  end

  def l_spaceship(y, x)
    filler(y, x)
    filler(y-2, x)
    filler(y-3, x-1)
    filler(y-3, x-2)
    filler(y-3, x-3)
    filler(y-3, x-4)
    filler(y-2, x-4)
    filler(y-1, x-4)
    filler(y, x-3)
    self
  end

  def born(coordinates)
    coordinates.each do |y_x|
      screen.board[y_x[0]][y_x[1]].state = "o"
    end
    self
  end

#######################################################


end


