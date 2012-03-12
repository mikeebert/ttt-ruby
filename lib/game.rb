require 'board'

class Game
  
  attr_accessor :board
  
  def initialize(size)
    @board = new_array = (1..size).to_a
             start_of_row = 1
             end_of_row = size
             new_array.each do |n| 
              row = new_array.find_index(n)
              new_array[row] = (start_of_row..end_of_row).to_a
              start_of_row = end_of_row + 1
              end_of_row = end_of_row + size
            end
  end
  
  def valid_move(n)
    @board.flatten.include?(n)
  end
  
  def player_move(n)
    row_number = 0
    @board.each do |row|
      if row.include?(n)
        position = row.find_index(n)
        @board[row_number][position] = "x"        
      end
      row_number += 1
    end
  end
  
  def computer_move
    if move_count == 1
      @board[1][1] == 5 ? @board[1][1] = "o" : @board[0][0] = "o"
    elsif move_count == 3
      if @board[0][0] == "x" && @board[2][1] == "x"
        @board[2][0] = "o"
      else
        first_available_space_move
      end
    else
      random_move
    end
  end
  
  def random_move
    y = rand(@board.count)
    x = rand(@board[0].count)
    if @board[y][x].class == Fixnum
      @board[y][x] = "o"
    else 
      random_move
    end
  end

  def first_available_space_move
    y = 0
    @board.each do |row|
      row.each do |value|
        if value.class == Fixnum
          x = row.find_index(value)
          @board[y][x] = "o"
          return
        end
      end
      y += 1
    end
  end
  
  def winner?
    @board.each do |row| 
      return true if row.uniq == ["x"] || row.uniq == ["o"] #rewrite this so it's independent of symbol
    end
    
    horizontal_positions = (0..(@board[0].count - 1)).to_a
    horizontal_positions.each do |x|
     return true if @board[0][x] == @board[1][x] && @board[0][x] == @board[2][x]
    end    
    
    #two horizontal methods are not independent of board size. REWRITE?
    return true if @board[0][0] == @board[1][1] && @board[1][1] == @board[2][2]
    return true if @board[0][2] == @board[1][1] && @board[1][1] == @board[2][0]
  end
  
  def draw?
    move_count == @board.flatten.count && winner? == nil
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

#rename and divide out Play, Game, TTT, Road
#hide away dependency from game class
# test UI (without gets and puts)