# frozen_string_literal: true

require './board.rb'
require './player.rb'

player_x = Player.new('X')
player_o = Player.new('O')
board = Board.new(player_x, player_o)

board.print_board
puts

until board.game_over?
  puts "Player #{board.current_player.mark}: Please give a position (A, B, C): "
  pos_y = gets.chomp.upcase
  pos_y = Board.row_mark.index(pos_y)

  puts "Player #{board.current_player.mark}: Please give a position (1,2,3): "
  pos_x = gets.chomp.to_i
  pos_x -= 1
  puts

  if board.placement(pos_x, pos_y) == false
    board.print_board
    puts
    puts 'Operation not permitted. Please try again.'
    next
  end

  puts
  board.print_board
  puts
end
