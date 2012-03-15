$: << File.expand_path(File.dirname(__FILE__) + "/lib")
require 'game'
require 'board'

game = Game.new(3)
game.board.human_symbol = "x"
game.board.computer_symbol = "o"

puts "Welcome to Tic Tac Toe. Enter a number corresponding to a position on the board below to make your first move."

game.display_board

while game.winner? != true

  input = gets.chomp.to_i
  
  if game.board.valid_move(input)
    game.human_move(input)
    if game.winner? != true && game.draw? == false
      game.computer_move
      puts "Nice Move, check out mine (the o's)."
    end
  else
    puts "Not a valid move. Please try again"
  end
  
  game.display_board
  
  if game.winner? == true
    puts "Winner. Game Over"
  elsif game.draw?
    game.display_board
    puts "Tie Game."
    break
  else 
    puts "Enter your next move:"
  end

end
