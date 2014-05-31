require 'optparse'
require_relative './board'

class Game

  # using named params to set defaults from the options hash
  def initialize(cols: 20, rows: 20, factor: 0.2, speed: 0.3)
    @speed = speed
    # add a turns options

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

# move to options parser class
options = {}

OptionParser.new do |opts|
  opts.banner = "Usage: ruby game.rb [options]"
  opts.separator ""
  opts.separator "Specific options: [default value]"

  opts.on("-c", "--cols COLS",     "Set column count. [20]")               { |c| options[:cols]   = c.to_i }
  opts.on("-r", "--rows ROWS",     "Set row count. [20]")                  { |r| options[:rows]   = r.to_i }
  opts.on("-f", "--factor FACTOR", "Chance a cell will seed alive. [0.2]") { |f| options[:factor] = f.to_f }
  opts.on("-s", "--speed SPEED",   "Refresh rate in seconds. [0.3]")       { |s| options[:speed]  = s.to_f }
end.parse!

# This allows program to accept command line arguments, if present
# If no arguments are present, either the user is pretty apathetic or the specs are being run
game = Game.new(options)

  # And then the game is played...
game.play
