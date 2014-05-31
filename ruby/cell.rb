class Cell
  attr_reader :row, :col
  attr_accessor :alive

  def initialize(row, col, alive = false)
    @row = row
    @col = col
    @alive = alive
  end

  def to_s
    @alive ? 'X' : ' '
  end
end