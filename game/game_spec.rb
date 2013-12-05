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
    # it "should not change the original screen" do
    #   my_game.generation
    #   expect(my_game.screen.board[5][15].state).to eq("0")
    # end
  end

  describe "#born" do
    it "should bring alive all the cells in the board in the coordinates you give it" do
      my_game = Game.new(5, 5)
      my_game.born([ [0, 0], [4, 4] ])
      expect(my_game.screen.board[0][0].state).to eq("o")
    end
    it "should bring alive all the cells in the board in the coordinates you give it" do
      my_game = Game.new(5, 5)
      my_game.born([ [0, 0], [4, 4] ])
      expect(my_game.screen.board[4][4].state).to eq("o")
    end
    it "should bring alive all the cells in the board in the coordinates you give it" do
      my_game = Game.new(5, 5)
      my_game.born([ [0, 0], [4, 4] ])
      expect(my_game.screen.board[4][0].state).to eq(".")
    end
  end

  describe "#block" do
    it "should bring alive a square of four cells with the coordinates passed at the upper left corner" do
      my_game = Game.new(5, 5)
      my_game.block(0, 0)
      expect(my_game.screen.board[0][0].state).to eq("o")
    end
    it "should bring alive a square of four cells with the coordinates passed at the upper left corner" do
      my_game = Game.new(5, 5)
      my_game.block(0, 0)
      expect(my_game.screen.board[0][1].state).to eq("o")
    end
    it "should bring alive a square of four cells with the coordinates passed at the upper left corner" do
      my_game = Game.new(5, 5)
      my_game.block(0, 0)
      expect(my_game.screen.board[1][1].state).to eq("o")
    end
    it "should bring alive a square of four cells with the coordinates passed at the upper left corner" do
      my_game = Game.new(5, 5)
      my_game.block(0, 0)
      expect(my_game.screen.board[1][0].state).to eq("o")
    end
  end

  describe "#se_glider" do
    it "should bring alive a se_glider with the coordinates passed at the upper left corner" do
      my_game = Game.new(5, 5)
      my_game.se_glider(1, 0)
      expect(my_game.screen.board[1][0].state).to eq("o")
    end
    it "should bring alive a se_glider with the coordinates passed at the upper left corner" do
      my_game = Game.new(5, 5)
      my_game.se_glider(1, 0)
      expect(my_game.screen.board[2][1].state).to eq("o")
    end
    it "should bring alive a se_glider with the coordinates passed at the upper left corner" do
      my_game = Game.new(5, 5)
      my_game.se_glider(1, 0)
      expect(my_game.screen.board[2][2].state).to eq("o")
    end
    it "should bring alive a se_glider with the coordinates passed at the upper left corner" do
      my_game = Game.new(5, 5)
      my_game.se_glider(1, 0)
      expect(my_game.screen.board[1][2].state).to eq("o")
    end
    it "should bring alive a se_glider with the coordinates passed at the upper left corner" do
      my_game = Game.new(5, 5)
      my_game.se_glider(1, 0)
      expect(my_game.screen.board[0][2].state).to eq("o")
    end
  end


end