require './game.rb'

game = Game.new

puts "Welcome to Tic-Tac-Toe. You will be X's. Enter a number corresponding to a position on the board below to make your first move."

game.display_board
  
while game.winner? != true
  move = gets.chomp.to_i
  
  if game.valid_move(move)
    game.player_move(move)
    if game.winner? != true
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

