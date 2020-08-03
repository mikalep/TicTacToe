# frozen_string_literal: true

require './Board.rb'
require './Player.rb'

player_x = Player.new('X')
player_o = Player.new('O')
board = Board.new(player_x, player_o)

board.print_board
puts

until board.game_over?
  puts "Player #{board.current_player.mark}: Please give x (horizontal position)"
  puts "Player #{board.current_player.mark}: Please give y (vertical position)"
  puts
  pos_x = gets.chomp.to_i
  pos_y = gets.chomp.to_i

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
