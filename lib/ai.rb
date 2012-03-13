require 'board'

class Ai
  
  def self.computer_move
  end
  
  # def computer_move
  #   
  #   if @board.move_count == 1
  #     @grid[1][1] == 5 ? @grid[1][1] = "o" : @grid[0][0] = "o"
  #   elsif move_count == 3
  #     if @grid[0][0] == "x" && @grid[2][1] == "x"
  #       @grid[2][0] = "o"
  #     else
  #       random_move
  #     end
  #   else
  #     random_move
  #   end
  # end
  
  # def self.random_move
  #   move = rand(@board.grid.flatten.count + 1)
  #   if @board.valid_move(move)
  #     location = @board.coordinates_of(move)
  #     y = location[0]
  #     x = location[1]      
  #     @board.grid[y][x] = "o"
  #   else
  #     random_move
  #   end
  # end
  
  
  
end