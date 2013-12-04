class Game
  attr_reader :height, :width
  attr_accessor :screen

  def initialize(height, width)
    @height = height
    @width = width
    @screen = Board.new(self)
    create_cells
    populate
  end

  def create_cells
    (height * width).times do
      Cell.new("0", self) # in this starting position they are all alive
    end
  end

  def populate # partition cells into #{height} arrays each with #{width} objects
    array_i = 0
    Cell::CELLS.each_with_index do |cell, i|
      array_i += 1 if (i % width == 0) && (i != 0)
      cell.h = array_i
      cell.w = i % width
      screen.board[array_i] << cell # populate screen
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