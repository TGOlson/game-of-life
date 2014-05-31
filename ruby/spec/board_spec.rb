require 'rspec'
require_relative '../board.rb'

describe Board do
  describe "initialize" do 
    let(:board) { board = Board.new 10, 10, 0.8 }

    it "should set a board array" do
      expect(board.current).to be_an_instance_of Array
    end

    it "should set a board with a length of rows" do
      expect(board.current.length).to eq 10
    end

    it "should set a row with a length of cols" do
      expect(board.current.first.length).to eq 10
    end
  end

end
