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


end