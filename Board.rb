# frozen_string_literal: true

class Board
  def initialize
    @board = [
      %w[X X X],
      %w[X X X],
      %w[X X X]
    ]
  end

  def placement(x, y)
    @board[y][x] = '0'
  end

  def print_board
    @board.each do |row|
      row.each do |cell|
        print cell
      end
      puts
    end
  end
end
