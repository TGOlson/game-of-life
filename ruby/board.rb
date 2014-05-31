require_relative './cell'

class Board
  attr_reader :current

  def initialize(cols, rows, factor)
    @cols = cols
    @rows = rows
    @factor = factor
    @current = create_board
  end

  def create_board
    raw_board = Array.new(@rows * @cols).each_slice(@cols).to_a

    raw_board.each_with_index do |row, i|
      row.each_index do |j|
        alive = rand > @factor
        raw_board[i][j] = Cell.new i, j, alive
      end
    end
  end

  def update
    @next = @current.dup

    @current.each do |row|
      row.each do |cell|
        neighbors = get_neighbors cell

        alive = find_next_state cell, neighbors

        @next[cell.row][cell.col].alive = alive
      end
    end
  end

  def get_neighbors(cell)
    diffs = [-1, 0, 1]

    neighbors = []

    diffs.each do |dif_row|
      diffs.each do |dif_col|
        next if dif_row == 0 && dif_col == 0

        row = cell.row + dif_row
        col = cell.col + dif_col

        next if row < 0 || row > @rows - 1
        next if col < 0 || col > @cols - 1

        neighbors << @current[row][col]
      end
    end

    neighbors
  end

  def find_next_state(cell, neighbors)
    living_neighbors = neighbors.select(&:alive).count

    return true if living_neighbors == 3
    return true if living_neighbors == 2 && cell.alive

    return false
  end
end
