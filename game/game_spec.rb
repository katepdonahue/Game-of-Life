require './game'
require '../board/board'
require '../cell/cell'

# my_game = Game.new(10, 30)
# my_game.screen.print_screen
# sleep(0.5)
# my_game.generation.print_screen


describe Game do

  describe "#create_cells" do
    it "should create 300 live cells upon initialization of a new game" do
      my_game = Game.new(10, 30)
      expect(Cell::CELLS.count).to eq(300)
    end
  end


end