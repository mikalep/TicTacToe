# frozen_string_literal: true

class Board
  attr_reader :current_player, :next_player

  @@row_mark = %w[A B C]

  def initialize(player_x, player_o)
    @board = [
      %w[_ _ _],
      %w[_ _ _],
      %w[_ _ _]
    ]
    @current_player = player_x
    @next_player = player_o
  end

  def placement(x, y)
    return false if @current_player.mark != 'X' && @current_player.mark != 'O'
    return false if x.negative? || x > 2
    return false if y.negative? || y > 2
    return false if @board[y][x] != '_'

    @board[y][x] = @current_player.mark
    @current_player, @next_player = @next_player, @current_player
  end

  def print_board
    puts '  1 2 3'

    @board.each_with_index do |row, idx|
      print @@row_mark[idx] + ' '

      row.each do |cell|
        print cell + ' '
      end
      puts
    end
  end

  def check_row?
    @board.each do |row|
      return true if row.all? { |mark| mark.eql?(@current_player.mark) }
      return true if row.all? { |mark| mark.eql?(@next_player.mark) }
    end
    false
  end

  def check_col?
    @board.each_with_index do |_, idx|
      if @board[0][idx].eql?(@current_player.mark) && @board[1][idx].eql?(@current_player.mark) && @board[2][idx].eql?(@current_player.mark)
        return true
      end

      if @board[0][idx].eql?(@next_player.mark) && @board[1][idx].eql?(@next_player.mark) && @board[2][idx].eql?(@next_player.mark)
        return true
      end
    end
    false
  end

  def check_diagonal?
    if @board[0][0].eql?(@current_player.mark) && @board[1][1].eql?(@current_player.mark) && @board[2][2].eql?(@current_player.mark)
      return true
    end

    if @board[0][0].eql?(@next_player.mark) && @board[1][1].eql?(@next_player.mark) && @board[2][2].eql?(@next_player.mark)
      return true
    end

    if @board[2][0].eql?(@current_player.mark) && @board[1][1].eql?(@current_player.mark) && @board[0][2].eql?(@current_player.mark)
      return true
    end

    if @board[2][0].eql?(@next_player.mark) && @board[1][1].eql?(@next_player.mark) && @board[0][2].eql?(@next_player.mark)
      return true
    end

    false
  end

  def check_full?
    return false if @board.any? { |cell| cell.include?('_') }

    puts "Game over. It's a tie."
    true
  end

  def game_over?
    true if check_full?
    if check_row? || check_col? || check_diagonal?
      puts "Congratulations! Player #{@next_player.mark} wins.\n"
      return true
    end
    false
  end

  def self.row_mark
    @@row_mark
  end
end
