# frozen_string_literal: true

class Board
  attr_reader :rows, :cols

  def initialize(rows, cols)
    raise 'Invalid rows' if rows < 1
    raise 'Invalid cols' if cols < 1

    @rows = rows
    @cols = cols
  end

  def set(row, col, val)
    board[row][col] = val
  end

  def get(row, col)
    raise 'Invalid row' if row.negative? || row >= rows
    raise 'Invalid col' if col.negative? || col >= cols

    board[row][col]
  end

  def draw
    (0...rows).each do |row|
      (0...cols).each do |col|
        cell = board[row][col]
        print cell
      end
      puts
    end
  end

  private

  def board
    @board ||= Array.new(rows) { Array.new(cols) }
  end
end
