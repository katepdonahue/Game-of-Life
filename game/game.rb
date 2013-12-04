class Game
  attr_reader :height, :width
  attr_accessor :screen

  def initialize(height, width)
    @height = height
    @width = width
    @screen = Board.new(self)
    # create_cells
    populate
  end

  def populate
    height.times do |y|
      width.times do |x|
        screen.board[y] << Cell.new("0", self).tap{|c| c.h=y; c.w=x}
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
    new_screen
  end

end


