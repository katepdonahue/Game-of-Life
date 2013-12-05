require './board'
require '../cell/cell'
require '../game/game'

my_game = Game.new(10, 30)
# we already confirmed in game_spec that @screen
# which is a Board object, is created at initialization

describe Board do

  describe "#generate_screen" do
    it "should add 10 arrays to the board attribute upon initialization" do
      expect(my_game.screen.board.count).to eq(10)
    end
  end

  describe "#print_screen" do
    # I don't know how to write tests for print
  end

end