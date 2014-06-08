require_relative './options'
require_relative './board'

class Game

  # using named params to set defaults from the options hash
  def initialize(cols: 20, rows: 20, factor: 0.2, speed: 0.3)
    @speed = speed
    @board = Board.new cols, rows, factor
  end

  def play
    while active
      self.to_s
      sleep @speed
      self.next_turn
    end

    self.to_s
    puts "The game of life has ended. No life remains."
  end

  def next_turn
    @board.update
  end

  def active
    @board.active
  end

  def to_s
    system "clear"
    puts @board.to_s
  end

end


options = Options.parse_options

# This allows program to accept command line arguments, if present
# If no arguments are present, either the user is pretty apathetic or the specs are being run
game = Game.new(options)

# And then the game is played...
game.play
