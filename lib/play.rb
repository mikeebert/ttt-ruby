$: << File.expand_path(File.dirname(__FILE__) + "./lib")
require 'game'

game = Game.new(3)

# puts "Welcome to Tic-Tac-Toe. What letter would you like to represent your moves? (hit return after you're done.)"

# while input.class != String
#   input = gets.chomp.slice(0).upcase
#   game.player_symbol = input
# end
#     
# puts "What letter would you like the computer symbol to be?"
# 
# while input.class != String || 
#   input = gets.chomp.slice(0).upcase
#   game.computer_symbol = input
# end

puts "Welcome to Tic Tac Toe. Enter a number corresponding to a position on the board below to make your first move."

game.display_board
  
while game.winner? == nil
  input = gets.chomp.to_i
  
  if game.board.valid_move(input)
    game.human_move(input)
    if game.winner? == nil && game.draw? == false
      game.computer_move
      puts "Nice Move, check out mine (the o's)."
    end
  else
    puts "Not a valid move. Please try again"
  end
  
  game.display_board
  
  if game.winner?
    puts "Winner. Game Over"
  elsif game.draw?
    game.display_board
    puts "Tie Game."
    break
  else 
    puts "Enter your next move:"
  end

end

