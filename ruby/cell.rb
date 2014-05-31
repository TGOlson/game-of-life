ALIVE_CHAR = 'X'
DEAD_CHAR  = ' '

class Cell
  attr_reader :row, :col
  attr_accessor :alive

  def initialize(row, col, alive = false)
    @row = row
    @col = col
    @alive = alive
  end

  def self.alive_char
    ALIVE_CHAR
  end

  def self.dead_char
    DEAD_CHAR
  end

  def to_s
    @alive ? Cell.alive_char : Cell.dead_char
  end
end
