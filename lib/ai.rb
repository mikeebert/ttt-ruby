require 'board'

class Ai
  
  def initialize
  end
  
  def self.move(board) # only exists for the initial purposes of testing!!!
    self.random_move(board)
  end
  
  def self.random_move(board)
    move_value = rand(board.grid.flatten.count + 1)    
    if board.valid_move(move_value)
      board.place_move(board.computer_symbol, move_value)
    else
      random_move(board)
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
  
end