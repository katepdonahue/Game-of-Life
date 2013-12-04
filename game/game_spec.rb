require './game'
require '../board/board'
require '../cell/cell'

my_game = Game.new(10, 30)



describe Game do

  describe "#create_cells" do
    it "should create 300 cells upon initialization of a new game" do
      expect(Cell::CELLS.count).to eq(300)
    end
  end

  describe "#populate" do
    it "should fill the screen with cell objects upon initialization" do
      expect(my_game.screen.board[rand(0..9)][rand(0..29)].class).to eq(Cell)
    end
    it "should give cell objects correct height and width values" do
      expect(my_game.screen.board[2][23].h).to eq(2)
    end
    it "should give cell objects correct height and width values" do
      expect(my_game.screen.board[2][23].w).to eq(23)
    end
  end

  describe "#generation" do
    it "should return a new board object filled with cells" do
      expect(my_game.generation.board[rand(0..9)][rand(0..29)].class).to eq(Cell)
    end
  end


end