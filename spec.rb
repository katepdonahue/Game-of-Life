require './game_of_life'

describe Cell do

  # it "Rule 1: Any live cell with 0 or 1 live neighbors dies" do
  #   cell = Cell.new
  #   expect(cell.neighbors.count).to eq(0)
  # end

  # describe "#state" do
  # it "should equal * when it is alive. It should equal ' ' when it's dead."
  #   cell1 = Cell.new("*")
  #   expect(cell1.state).to eq("*")
  #   cell2 = Cell.new(" ")
  #   expect(cell2.state).to eq(" ")
  # end

  describe "#find_neighbors" do
    my_game = Game.new(10, 30)
    it "check first clause: left" do
      expect(my_game.screen[0][0].find_neighbors.count).to eq(3)
      expect(my_game.screen[0][0].find_neighbors[0].class).to eq(Cell)
    end
    it "check second clause: right" do
      expect(my_game.screen[0][29].find_neighbors.count).to eq(3)
      expect(my_game.screen[0][29].find_neighbors[0].class).to eq(Cell)
    end
  end
end