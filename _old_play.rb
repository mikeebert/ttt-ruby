require './lib/game.rb'

@game = Game.new

puts "Welcome to Tic-Tac-Toe. You will be X's. Enter a number corresponding to a position on the board below to make your first move."

@game.display_board
  
while @game.win? == nil
  move = gets.chomp
  
  if @game.valid_move(move.to_i) == true
    @game.player_move(move.to_i)
    if @game.win? == nil
      @game.computer_move
      puts "Nice Move, check out mine (the O's)."
    end
  else
    puts "Not a valid move. Please try again"
  end
  
  @game.display_board
  
  if @game.win?
    puts "Winner. Game Over"
  elsif @game.draw?
    @game.display_board
    puts "Tie Game."
    break
  else 
    puts "Enter your next move:"
  end
  
end

