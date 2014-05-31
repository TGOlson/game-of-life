require_relative './cell'

class Board
  attr_reader :current_board

  def initialize(cols, rows, factor)
    @cols   = cols
    @rows   = rows
    @factor = factor

    @current_board = create_board
  end

  def create_board
    raw_board = Array.new(@rows * @cols).each_slice(@cols).to_a

    populate_board raw_board
  end

  def populate_board(raw_board)
    raw_board.each_with_index do |row, i|
      row.each_index do |j|
        alive = rand < @factor
        raw_board[i][j] = Cell.new i, j, alive
      end
    end
  end

  def update
    @next_board = @current_board.dup

    @current_board.each do |row|
      row.each do |cell|
        neighbors = get_neighbors cell
        update_cell_state cell, neighbors
      end
    end

    swap_boards
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

        neighbors << @current_board[row][col]
      end
    end

  def update_cell_state(cell, neighbors)
    state = find_next_state cell, neighbors

    next_cell = cell.dup
    next_cell.alive = state

    @next_board[cell.row][cell.col] = next_cell
  end


    neighbors
  end

  def find_next_state(cell, neighbors)
    living_neighbors = neighbors.select(&:alive).count

    living_neighbors == 3 || (living_neighbors == 2 && cell.alive)
  end

  def swap_boards
    #consider keeping track of previous board
    @last_board = @current_board
  end

  def active
    # consider adding last and current board equality checks
    to_s.flatten.join.include?(Cell.alive_char)
  end

  def to_s
    @current_board.map {|row| row.map(&:to_s).join ' '}
  end
end
