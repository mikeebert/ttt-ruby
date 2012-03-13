require 'board'

class Game
  
  attr_accessor :board
  attr_accessor :human_symbol
  attr_accessor :computer_symbol
  
  def initialize
    @board = Board.new(3)
    @grid = @board.grid
  end
      
  def human_move(n)
    row_number = 0
    @grid.each do |row|
      if row.include?(n)
        position = row.find_index(n)
        @grid[row_number][position] = "x"        
      end
      row_number += 1
    end
  end
  
  def computer_move
    if move_count == 1
      @grid[1][1] == 5 ? @grid[1][1] = "o" : @grid[0][0] = "o"
    elsif move_count == 3
      if @grid[0][0] == "x" && @grid[2][1] == "x"
        @grid[2][0] = "o"
      else
        random_move
      end
    else
      random_move
    end
  end
  
  def random_move
    move = rand(@grid.flatten.count + 1)
    if @board.valid_move(move)
      location = @board.coordinates_of(move)
      y = location[0]
      x = location[1]      
      @grid[y][x] = "o"
    else
      random_move
    end
  end

  # def first_available_space_move
  #   y = 0
  #   @grid.each do |row|
  #     row.each do |value|
  #       if value.class == Fixnum
  #         x = row.find_index(value)
  #         @grid[y][x] = "o"
  #         return
  #       end
  #     end
  #     y += 1
  #   end
  # end
  
  def winner?
    @grid.each do |row| 
      return true if row.uniq == ["x"] || row.uniq == ["o"] #rewrite this so it's independent of symbol
    end
    
    horizontal_positions = (0..(@grid[0].count - 1)).to_a
    horizontal_positions.each do |x|
     return true if @grid[0][x] == @grid[1][x] && @grid[0][x] == @grid[2][x]
    end    
    
    #two horizontal methods are not independent of board size. REWRITE?
    return true if @grid[0][0] == @grid[1][1] && @grid[1][1] == @grid[2][2]
    return true if @grid[0][2] == @grid[1][1] && @grid[1][1] == @grid[2][0]
  end
  
  def draw?
    move_count == @grid.flatten.count && winner? == nil
  end
      
  def move_count
    count = 0
    @grid.flatten.each {|position| count += 1 if position.class == String}
    return count
  end
  
  def display_board
    @grid.each do |line| 
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