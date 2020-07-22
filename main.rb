# frozen_string_literal: true

require './Board.rb'

board = Board.new

puts 'Please give x (horizontal position)'
puts 'Please give y (vertical position)'

pos_x = gets.chomp.to_i
pos_y = gets.chomp.to_i

board.placement(pos_x, pos_y)
board.print_board
