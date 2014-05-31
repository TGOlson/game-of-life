require 'rspec'
require './game'
require './board'

describe Game do
  let(:game) { game = Game.new 10, 10 }

  describe "initialize" do 
    it "should set a board value" do
      expect(game.board).to be_an_instance_of Board
    end
  end

end