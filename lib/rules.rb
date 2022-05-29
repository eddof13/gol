require_relative 'cell'

module Rules
  class Base
    def self.neighbors(board, row, col)
      count = 0

      #nw
      count += 1 if self.neighbor?(board, row, col-1)
      #nw
      count += 1 if self.neighbor?(board, row-1, col-1)
      #n
      count += 1 if self.neighbor?(board, row-1, col)
      #ne
      count += 1 if self.neighbor?(board, row-1, col+1)
      #e
      count += 1 if self.neighbor?(board, row, col+1)
      #se
      count += 1 if self.neighbor?(board, row+1, col+1)
      #s
      count += 1 if self.neighbor?(board, row+1, col)
      #sw
      count += 1 if self.neighbor?(board, row+1, col-1)
      
      count
    end

    def self.neighbor?(board, row, col)
      board.get(row, col) == Cell::Alive
    rescue
      false
    end

    def self.apply(board, row, col)
      raise "not implemented"
    end
  end
  
  class ExactlyThreeNeighbors < Base
    def self.apply(board, row, col)
      self.neighbors(board, row, col) == 3
    end
  end

  class ExactlyTwoNeighborsAndAlive < Base
    def self.apply(board, row, col)
      self.neighbors(board, row, col) == 2 && board.get(row, col) == Cell::Alive
    end
  end
end
