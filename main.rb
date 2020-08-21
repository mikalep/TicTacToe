# frozen_string_literal: true

require './board.rb'
require './player.rb'

player_x = Player.new('X')
player_o = Player.new('O')
board = Board.new(player_x, player_o)

board.print_board
puts

until board.game_over?
  puts "Player #{board.current_player.mark}: Please give your position (eg. A1, A3, C2): "
  position = gets.chomp.upcase

  if board.placement(position) == false
    board.print_board
    puts
    puts 'Operation not permitted. Please try again.'
    puts
    next
  end

  puts
  board.print_board
  puts
end
