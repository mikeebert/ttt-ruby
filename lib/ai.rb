require 'board'

class Ai
  
  def initialize
  end
  
  def self.move(board) # only exists for the initial purposes of testing!!!
    self.random_move(board)
  end
  
  def self.random_move(board)
    move = rand(board.grid.flatten.count + 1)
    if board.valid_move(move)
      location = board.coordinates_of(move)
      y = location[0]
      x = location[1]      
      @board = board
      @board.grid[y][x] = "o"
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