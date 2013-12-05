require './cell'
require '../board/board'
require '../game/game'

my_game = Game.new(10, 30)
# my_game.screen.print_screen
# sleep(0.5)
# my_game.generation.print_screen


describe Cell do

  describe "#find_neighbors" do
    my_cell = Cell.new("0", my_game)
    it "if 1: should not break when a neighbor doesn't exist" do
      my_cell.tap{ |c| c.h = 8; c.w = 0}
      expect(my_cell.find_neighbors.count).to eq(5)
    end
    it "if 2: should not break when a neighbor doesn't exist" do
      my_cell.tap{ |c| c.h = 7; c.w = 29}
      expect(my_cell.find_neighbors.count).to eq(5)
    end
    it "if 3: should not break when a neighbor doesn't exist" do
      my_cell.tap{ |c| c.h = 0; c.w = 0}
      expect(my_cell.find_neighbors.count).to eq(3)
    end
    it "if 4: should not break when a neighbor doesn't exist" do
      my_cell.tap{ |c| c.h = 0; c.w = 23}
      expect(my_cell.find_neighbors.count).to eq(5)
    end
    it "if 5: should not break when a neighbor doesn't exist" do
      my_cell.tap{ |c| c.h = 0; c.w = 29}
      expect(my_cell.find_neighbors.count).to eq(3)
    end
    it "if 6: should not break when a neighbor doesn't exist" do
      my_cell.tap{ |c| c.h = 9; c.w = 0}
      expect(my_cell.find_neighbors.count).to eq(3)
    end
    it "if 7: should not break when a neighbor doesn't exist" do
      my_cell.tap{ |c| c.h = 9; c.w = 23}
      expect(my_cell.find_neighbors.count).to eq(5)
    end
    it "if 8: should not break when a neighbor doesn't exist" do
      my_cell.tap{ |c| c.h = 9; c.w = 29}
      expect(my_cell.find_neighbors.count).to eq(3)
    end
    it "should have 8 neighbors when cell is in the middle of the board" do
      my_cell.tap{ |c| c.h = 6; c.w = 6}
      expect(my_cell.find_neighbors.count).to eq(8)
    end
  end

  describe "#live_neighbors" do
    it "should return an array of cell objects, all with state '0'" do
      my_cell = Cell.new("0", my_game)
      neighbors_array = [ Cell.new("0", my_game), Cell.new("-", my_game), Cell.new("-", my_game)]
      expect(my_cell.live_neighbors(neighbors_array).count).to eq(1) 
    end
  end

  describe "#tick" do
    it "underpopulation: should change a live cell to dead if 0 or 1 live neighbors" do
      my_cell = Cell.new("0", my_game)
      my_cell.stub(:find_neighbors => [ Cell.new("0", my_game)])
      expect(my_cell.tick.state).to eq ("-")
    end
    it "should keep a live cell alive if 2 or 3 live neighbors" do
      my_cell = Cell.new("0", my_game)
      my_cell.stub(:find_neighbors => [ Cell.new("0", my_game), Cell.new("0", my_game)])
      expect(my_cell.tick.state).to eq ("0")
    end
    it "overcrowding: should change a live cell to dead if 4 or more live neighbors" do
      my_cell = Cell.new("0", my_game)
      my_cell.stub(:find_neighbors => [ Cell.new("0", my_game), Cell.new("0", my_game), Cell.new("0", my_game), Cell.new("0", my_game)])
      expect(my_cell.tick.state).to eq ("-")
    end
    it "reproduction: should change a dead cell to alive if exactly 3 neighbors live" do
      my_cell = Cell.new("-", my_game)
      my_cell.stub(:find_neighbors => [ Cell.new("0", my_game), Cell.new("0", my_game), Cell.new("0", my_game)])
      expect(my_cell.tick.state).to eq ("0")
    end
  end


end