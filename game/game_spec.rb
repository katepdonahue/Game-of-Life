require './game'
require '../board/board'
require '../cell/cell'

my_game = Game.new(10, 30)
# my_game.screen.print_screen
# sleep(0.5)
# my_game.generation.print_screen


describe Game do

  describe "#create_cells" do
    it "should create 300 live cells upon initialization of a new game" do
      expect(Cell::CELLS.count).to eq(300)
    end
  end

  describe "#populate" do
    it "should fill the screen with cell objects upon initialization" do
      expect(my_game.screen.board[rand(0..9)][rand(0..29)].class).to eq(Cell)
    end
    it "should" do

    end
  end


end