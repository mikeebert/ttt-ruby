class Game
  
  attr_accessor :board
  
  def initialize
    @board = [[1,2,3],
              [4,5,6],
              [7,8,9]]
  end
  
  def player_move(n)
    row_number = 0
    @board.each do |row|
      if row.include?(n)
        position = row.find_index(n)
        @board[row_number][position] = "X"        
      end
      row_number += 1
    end
  end
  
  def computer_move
    if move_count == 1
      @board[1][1] == 5 ? @board[1][1] = "O" : @board[0][0] = "O"
    elsif move_count == 3
      if @board[0][0] == "X" && @board[2][1] == "X"
        @board[2][0] = "O"
      # elsif @board[0][1] == "X" && @board[1][0] 
      #   @board[0][0] = "O"
      else 
        #brute force to fill the board
      end
    end
  end
  
  def valid_move(n)
    @board.flatten.include?(n)
  end
  
  def win?
    @board.each do |row| 
      if row.uniq == ["X"] || row.uniq == ["O"] #rewrite this so it's independent of symbol
        return true
      end
    end
    
    horizontal_positions = (0..(@board[0].count - 1)).to_a
    horizontal_positions.each do |x|
      if @board[0][x] == @board[1][x] && @board[0][x] == @board[2][x]
        return true
      end
    end    
    
    if @board[0][0] == @board[1][1] && @board[1][1] == @board[2][2]
      return true
    end

    if @board[0][2] == @board[1][1] && @board[1][1] == @board[2][0]
      return true
    end
  end
  
  def draw?
    move_count == @board.flatten.count && win? != true
  end
      
  def move_count
    count = 0
    @board.flatten.each {|position| count += 1 if position.class == String}
    return count
  end
  
  def display_board
    @board.each do |line| 
      line.each {|value| print "#{value} "}
      print "\n"
    end
    print "-------\n"
  end
  
private


end