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
    board.each do |array|
      array.each do |cell|
        print "#{cell.state}  "
      end
      print "\n"
    end
  end

end