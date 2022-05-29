# frozen_string_literal: true

require_relative 'rules'
require_relative 'cell'
require_relative 'board'

class Game
  CELL_TYPES = [Cell::Alive, Cell::Dead].freeze
  RULES = [Rules::ExactlyThreeNeighbors, Rules::ExactlyTwoNeighborsAndAlive].freeze

  def generate_seed(rows, cols)
    @board = Board.new(rows, cols)
    (0...rows).each do |row|
      (0...cols).each do |col|
        board.set(row, col, CELL_TYPES.sample)
      end
    end
  end

  def load_seed(path)
    # TODO: implement starting seed option
  end

  def start(generations)
    raise 'Game not initialized' if board.nil?

    (0..generations).each do |gen|
      draw(gen)
      tick
    end
  end

  private

  attr_reader :board

  def draw(generation)
    puts "Generation #{generation}"
    board.draw
    puts
  end

  def tick
    temp = Board.new(board.rows, board.cols)
    (0...board.rows).each do |row|
      (0...board.cols).each do |col|
        temp.set(row, col, apply_rules(board, row, col))
      end
    end
    @board = temp
  end

  def apply_rules(board, row, col)
    if RULES.any? { |rule| rule.apply(board, row, col) }
      Cell::Alive
    else
      Cell::Dead
    end
  end
end
