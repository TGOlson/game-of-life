require './board'

class Game
  attr_reader :board, :next_turn

  def initialize(options)
    cols   = (options.shift || 10).to_i
    rows   = (options.shift || 10).to_i
    factor = (options.shift || 0.8).to_f
    
    @speed  = (options.shift || 0.3).to_f

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
    @board.current.each do |row|
      puts row.map(&:to_s).join
    end
    puts
  end

  def next_turn
    @board.update
  end

end

game = Game.new(ARGV) unless ARGV.empty?
game.play
