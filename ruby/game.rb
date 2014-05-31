require_relative './board'

class Game
  attr_reader :board, :next_turn

  def initialize(options)
    cols   = (options['--cols']   || 10).to_i
    rows   = (options['--rows']   || 10).to_i
    factor = (options['--factor'] || 0.8).to_f
    @speed = (options['--speed']  || 0.3).to_f

    # add a turns options

    @board = Board.new cols, rows, factor
  end

  def play
    while true
      system "clear"
      self.to_s
      sleep @speed
      self.next_turn
    end
  end

  def to_s
    @board.current.each {|row| puts row.map(&:to_s).join}
    puts
  end

  def next_turn
    @board.update
  end

end

# This allows program to accept command line arguments, if present
# If no arguments are present, either the user is pretty apathetic or the specs are being run
first = ARGV.shift if ARGV.first.match('ruby')

unless first && first.match('spec')
  game = Game.new(Hash[*ARGV])

  # And then the game is played...
  game.play
end
