require 'rspec'
require_relative '../game.rb'
require_relative '../board.rb'

describe Game do
  let(:game) { game = Game.new '--rows'=> 10, '--cols'=> 10 }

  describe "initialize" do 
    it "should set a board value" do
      expect(game.board).to be_an_instance_of Board
    end
  end

end