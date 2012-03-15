require 'board'
require 'ai'

class Game
  
  attr_accessor :board
  
  def initialize(n)
    @board = Board.new(n)
  end
  
  
  
  def play

    while @board.has_winner != true

      input = gets.chomp.to_i #move this into some sort of interface class? UI.get_input?

      if @board.valid_move(input) # only want to execute the computer move if two things are true. 
                                  # that the move is valid and that it wasn't a winning move.
                                  # move this check into the human_move, or keep in the Board class?
        self.human_move(input) #ok
        
        if @board.has_winner != true && @board.is_draw == false #rewrite into one method that
                                                                # checks_for_winner?
          self.computer_move 
          puts "Nice Move, check out mine (the o's)." #return this message within the move ONLY if 
                                                      #there isn't a winner.
        end
      else
        puts "Not a valid move. Please try again" #return this message if the move is not valid
      end

      self.display_board # displaying board after move

      if @board.has_winner || @board.is_draw
        self.closing_messages
        break
      else
        puts "Enter your next move:"
      end
    end
  end
  
  
  def closing_messages
    if @board.has_winner 
      puts "Winner. Game Over"
    else
      puts "Tie Game."
    end
  end
  
  def human_move(n)
    self.board.place_human_move(n)
  end
  
  def computer_move
    Ai.move(@board)
  end
  
  def display_board
    @board.grid.each do |line| 
      line.each {|value| print "#{value} "}
      print "\n"
    end
    print "-------\n"
  end
  
end